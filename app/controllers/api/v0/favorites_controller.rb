class Api::V0::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :user, only: %i[create destroy]

  def create
    user.favorites
      .unscoped
      .find_or_create_by(user: user, geo_id: params[:geo_id])
      .update(active: true)
    render json: { 'message': 'Favorite added' }, status: 201
  end

  def destroy
    user.favorites
      .find_by(geo_id: params[:geo_id])
      .update(active: false)

    render json: { 'message': 'Favorite removed' }, status: 204
  end

  private

  def user
    @user ||= User.find_by_id(params[:user_id])
  end
end
