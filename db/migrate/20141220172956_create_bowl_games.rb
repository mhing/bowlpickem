class CreateBowlGames < ActiveRecord::Migration
  def change
    create_table :bowl_games do |t|
      t.string :name
      t.date :kickoff_date
      t.time :kickoff_time
      t.string :location
      t.string :tv_provider

      t.timestamps
    end
  end
end
