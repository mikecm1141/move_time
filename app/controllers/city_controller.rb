# frozen_string_literal: true

# Controller for City show
class CityController < ApplicationController
  after_action :save_view, only: :show

  def show
    @city = CityInformation.new(params[:id])
  end

  private

  def save_view
    if current_user
      current_user
        .views
        .find_or_create_by(geo_id: params[:id])
        .update(updated_at: Time.current)
    end
  end
end
