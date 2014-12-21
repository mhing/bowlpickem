class Admin::BowlGamesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_admin

  expose(:bowl_games) {BowlGame.all}
  expose(:bowl_game)

  def index
    @layout_class = 'admin-view'
  end

  def edit

  end

  def update

  end

  def destroy
    
  end

  def import_game_matchups
    result = BowlGame.import(params[:file])
    redirect_to admin_bowl_games_path, notice: result
  end

private
  def ensure_user_is_admin
    authorize! :show, 'admin' unless session[:admin]
  end
end
