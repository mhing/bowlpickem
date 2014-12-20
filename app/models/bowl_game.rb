class BowlGame < ActiveRecord::Base
  attr_accessible :name, :kickoff_date, :kickoff_time, :location, :tv_provider

  has_many :bowl_game_teams
  has_many :teams, :through => :bowl_game_teams
end
