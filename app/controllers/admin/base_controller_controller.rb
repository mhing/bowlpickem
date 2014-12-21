class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_admin

private
  def ensure_user_is_admin
    authorize! :show, 'admin' unless session[:admin]
  end
end