class Admin::BowlGamesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_admin

  expose(:bowl_games) {BowlGame.all}
  expose(:bowl_game)

  def index
    @layout_class = 'admin-view'
  end

  def new
    @bowl_game = BowlGame.new
  end

  def create
    debugger
    @bowl_game = BowlGame.new(params[:bowl_game])

    if @bowl_game.save
      redirect_to admin_bowl_games_path
    else
      render :action => :new
    end
  end

  def edit
    @bowl_game = BowlGame.find params[:id]
  end

  def update
    @bowl_game = BowlGame.find params[:id]

    @bowl_game.attributes = params[:bowl_game]

    if @bowl_game.save
      redirect_to admin_bowl_games_path
    else
      render :action => :edit
    end
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
