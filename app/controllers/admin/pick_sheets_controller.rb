class Admin::PickSheetsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_admin

  expose(:pick_sheets) {PickSheet.all}
  expose(:pick_sheet)

  def index
    @layout_class = 'admin-view'
  end

  def edit

  end

  def update

  end

  def destroy
    
  end

  def import_pick_sheets
    result = PickSheet.import(params[:file])
    redirect_to admin_pick_sheets_path, notice: result
  end

private
  def ensure_user_is_admin
    authorize! :show, 'admin' unless session[:admin]
  end
end
