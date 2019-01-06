# frozen_string_literal: true

# Class for the Users Controller
class UsersController < ApplicationController
  before_action :require_user, :user, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to dashboard_path
    else
      flash.now[:error] = @user.errors.full_messages.join('. ')
      render :new
    end
  end

  def show; end

  private

  def user_params
    params
      .require(:user)
      .permit(:first_name,
              :last_name,
              :email,
              :password,
              :password_confirmation)
  end

  def user
    @user ||= User.find(current_user.id)
  end
end
