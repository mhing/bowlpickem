class AddDateTimeToBowlGame < ActiveRecord::Migration
  def change
    add_column :bowl_games, :kickoff_date, :datetime
  end
end
