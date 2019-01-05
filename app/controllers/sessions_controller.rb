# frozen_string_literal: true

# Class for handling sessions at the controller level
class SessionsController < ApplicationController
  before_action :get_user, only: :create

  def new; end

  def create
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id.to_s
      flash[:success] = 'Successfully logged in'
      redirect_to dashboard_path
    else
      flash.now[:notice] = 'Invalid email or password'
      render :new
    end
  end

  private
  attr_reader :user

  def session_params
    params.require(:login).permit(:email, :password)
  end

  def get_user
    @user ||= User.find_by(email: session_params[:email])
  end
end
