class ApplicationController < ActionController::Base
  before_action :current_user
  helper_method :current_user, :require_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to root_path unless current_user
  end
end
