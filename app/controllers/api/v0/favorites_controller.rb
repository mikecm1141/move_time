class Api::V0::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :user, :favorite, only: %i[create destroy]

  def create
    if user.set_favorite(favorite)
      render json: { 'message': 'Favorite added' }, status: 201
    else
      render json: { 'message': 'Something went wrong!' }, status: 400
    end
  end

  def destroy
    if user.deactivate_favorite(favorite)
      render json: { 'message': 'Favorite removed'}, status: 204
    else
      render json: { 'message': 'Something went wrong!' }, status: 400
    end
  end

  private

  def user
    @user ||= User.find_by_id(params[:user_id])
  end

  def favorite
    @favorite ||= Favorite.find_or_create_by(geo_id: params[:geo_id])
  end
end
