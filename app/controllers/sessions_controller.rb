# frozen_string_literal: true

# Class for handling sessions at the controller level
class SessionsController < ApplicationController
  before_action :user, :authenticate_user, :validate_auth, only: :create
  before_action :require_user, :destroy_session, only: :destroy

  def new; end

  def create
    session[:user_id], flash[:success] = user.id.to_s, 'Successfully signed in'
    redirect_to dashboard_path
  end

  def destroy
    flash[:success] = 'Successfully signed out'
    redirect_to root_path
  end

  private

  def session_params
    params.require(:login).permit(:email, :password)
  end

  def user
    @user ||= User.find_by(email: session_params[:email])
  end

  def authenticate_user
    user&.authenticate(session_params[:password])
  end

  def validate_auth
    unless authenticate_user
      flash.now[:error] = 'Invalid email or password'
      render :new
    end
  end

  def destroy_session
    session.delete(:user_id)
  end
end
