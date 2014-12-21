class TeamsController < ApplicationController
  expose(:teams) {Team.all}

  def index
    @layout_class = 'team-view'
  end
end
