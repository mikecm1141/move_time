# frozen_string_literal: true

# Facade for the city search result
class CitySearchResult
  include Serviceable

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def cities
    filtered_locations.map do |city_data|
      CitySearchItem.new(city_data)
    end
  end

  def count
    cities.count
  end

  private

  def city_results
    @city_results ||= hashed_data(data_usa_service.city_results(query))
  end

  def filtered_locations
    city_results.select do |result|
      result[:id][0..2] == '160'
    end
  end
end
