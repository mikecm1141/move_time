# frozen_string_literal: true

# Class for handling sessions at the controller level
class SessionsController < ApplicationController
  before_action :get_user, only: :create
  before_action :require_user, :destroy_session, only: :destroy

  def new; end

  def create
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id.to_s
      flash[:success] = 'Successfully signed in'
      redirect_to dashboard_path
    else
      flash.now[:error] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    flash[:success] = 'Successfully signed out'
    redirect_to root_path
  end

  private
  attr_reader :user

  def session_params
    params.require(:login).permit(:email, :password)
  end

  def get_user
    @user ||= User.find_by(email: session_params[:email])
  end

  def destroy_session
    session.delete(:user_id)
  end
end
