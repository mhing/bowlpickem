class Team < ActiveRecord::Base
  attr_accessible :name, :nickname, :wins, :losses

  has_many :bowl_game_teams
  has_many :bowl_game, :through => :bowl_game_teams
  
end
