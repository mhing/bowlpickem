class PickSheetPicks < ActiveRecord::Base
  attr_accessible :pick_sheet_id, :pick_id

  belongs_to :pick_sheet
  belongs_to :pick
end
