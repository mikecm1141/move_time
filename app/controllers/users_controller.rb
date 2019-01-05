class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to dashboard_path
    else
      flash.now[:notice] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params
      .require(:user)
      .permit(:first_name,
              :last_name,
              :email,
              :password,
              :password_confirmation
            )
  end
end
