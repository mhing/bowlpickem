class BowlGamesController < ApplicationController
  
  expose(:bowl_game)
  expose(:bowl_games) {BowlGame.all}

  def index
    
  end
end
