class Pick < ActiveRecord::Base
  attr_accessible :confidence, :bonus, :bonus_amount

  has_one :team
  belongs_to :bowl_game
end
