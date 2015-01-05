class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :team
      t.integer :confidence
      t.boolean :bonus
      t.integer :bonus_amount
      t.references :bowl_game

      t.timestamps
    end
  end
end
