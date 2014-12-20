class Team < ActiveRecord::Base
  attr_accessible :name, :nickname, :wins, :losses
end
