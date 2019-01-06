# frozen_string_literal: true

# Facade for the city search results
class CitySearchResult
  attr_reader :query

  def initialize(query)
    @query = query
  end

  def cities
    city_results[:'city:search-results'].map do |city_data|
      CitySearchItem.new(city_data)
    end
  end

  def count
    cities.count
  end

  private

  def teleport_service
    TeleportService.new
  end

  def city_results
    @city_results ||= teleport_service.city_results(query)[:_embedded]
  end
end
