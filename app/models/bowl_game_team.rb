class BowlGameTeam < ActiveRecord::Base
  attr_accessible :bowl_game_id, :team_id

  belongs_to :bowl_game
  belongs_to :team
end
