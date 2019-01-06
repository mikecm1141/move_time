# frozen_string_literal: true

# Search controller class for searching for cities
class SearchController < ApplicationController
  def index
    @results = CitySearchResult.new(params[:q])
  end
end
