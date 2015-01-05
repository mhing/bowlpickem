class CreatePickSheets < ActiveRecord::Migration
  def change
    create_table :pick_sheets do |t|
      t.string :player_name
      t.integer :tiebreaker_points
      t.integer :year
      t.references :user

      t.timestamps
    end
  end
end
