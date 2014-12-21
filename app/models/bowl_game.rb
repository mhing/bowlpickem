require 'csv'

class BowlGame < ActiveRecord::Base
  attr_accessible :name, :kickoff_date, :kickoff_time, :location, :tv_provider, :bowl_game_teams_attributes

  has_many :bowl_game_teams
  has_many :teams, :through => :bowl_game_teams
  accepts_nested_attributes_for :bowl_game_teams

  def self.import(file)
    if [".csv", ".xls", ".xlsx"].include? File.extname(file.original_filename)
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        bowl_game = new
        team_1 = Team.create(:name => row["Team 1"])
        team_2 = Team.create(:name => row["Team 2"])

        bowl_game_teams_attributes = [{:team_id => team_1.id}, {:team_id => team_2.id}]

        bowl_game.attributes = {:name => row["BOWL GAME"], 
                                :location => row["LOCATION"],
                                :tv_provider => row["TV"],
                                :kickoff_date => row["DATE"],
                                :kickoff_time => row["TIME"],
                                :bowl_game_teams_attributes => bowl_game_teams_attributes}

        bowl_game.save!
      end
      return "Imported successfully"
    else
      return "Error importing file. Invalid file type."
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def team(index)
    teams[index]
  end
end
