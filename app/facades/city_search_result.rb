# frozen_string_literal: true

# Facade for the city search results
class CitySearchResult
  include Serviceable

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def cities
    hashed_data.map do |city_data|
      CitySearchItem.new(city_data)
    end
  end

  def count
    cities.count
  end

  private

  def city_results
    @city_results ||= data_usa_service.city_results(query)
  end

  def hashed_data
    city_results[:data].map do |city|
      city_results[:headers].zip(city).to_h.symbolize_keys
    end
  end
end
