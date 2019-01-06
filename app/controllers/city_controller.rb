# frozen_string_literal: true

# Controller for City show
class CityController < ApplicationController
  def show
    @city = CityInformation.new(params[:id])
  end
end
