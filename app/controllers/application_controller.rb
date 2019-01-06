class ApplicationController < ActionController::Base
  before_action :current_user
  helper_method :current_user, :require_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    flash[:error] = 'You must be signed in for that action'
    redirect_to root_path unless current_user
  end
end
