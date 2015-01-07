class RemoveDateTimeFromBowlGame < ActiveRecord::Migration
  def change
    remove_column :bowl_games, :kickoff_date, :date
    remove_column :bowl_games, :kickoff_time, :time
  end
end
