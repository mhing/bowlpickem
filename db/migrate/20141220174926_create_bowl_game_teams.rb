class CreateBowlGameTeams < ActiveRecord::Migration
  def change
    create_table :bowl_game_teams do |t|
      t.references :bowl_game
      t.references :team

      t.timestamps
    end
  end
end
