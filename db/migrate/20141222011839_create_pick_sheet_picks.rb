class CreatePickSheetPicks < ActiveRecord::Migration
  def change
    create_table :pick_sheet_picks do |t|
      t.references :pick_sheet
      t.references :pick

      t.timestamps
    end
  end
end
