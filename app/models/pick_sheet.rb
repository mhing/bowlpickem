require 'csv'

class PickSheet < ActiveRecord::Base
  attr_accessible :player_name, :tiebreaker_points, :year, :pick_sheet_picks_attributes

  has_many :pick_sheet_picks
  has_many :picks, :through => :pick_sheet_picks
  accepts_nested_attributes_for :pick_sheet_picks

  belongs_to :user

  def self.import(file)
    if [".csv", ".xls", ".xlsx"].include? File.extname(file.original_filename)
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(1)

      pick_sheet = new
      pick_sheet_picks_attributes = []

      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]

        bowl_game = BowlGame.find_by_name(row["BOWL GAME"])

        if bowl_game
          pick_team = Team.find_by_name(row["MATCHUP"])

          if pick_team
            points = row["POINTS"]
            bonus_amount = row["BONUS"]

            bonus_present = bonus_amount.present?

            pick = Pick.create(:confidence => points, :bonus => bonus_present, :bonus_amount => bonus_amount)

            pick_sheet_picks_attributes << {:pick_id => pick.id}
          end
        end
      end

      debugger

      pick_sheet.attributes = {:tiebreaker_points => 0, :year => 2014, :pick_sheet_picks_attributes => pick_sheet_picks_attributes}
      pick_sheet.save!

      return "Imported pick sheet successfully"
    else
      return "Error importing pick sheet. Invalid file type."
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
