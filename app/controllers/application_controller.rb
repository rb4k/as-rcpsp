class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def edit
    @user = User.find(params[:id])
  end
end
