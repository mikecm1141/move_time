# frozen_string_literal: true

# The class for a city as a search item
class CitySearchItem
  attr_reader :id,
              :name,
              :slug

  def initialize(city_data)
    @id   = city_data[:id]
    @name = city_data[:display]
    @slug = city_data[:url_name]
  end
end
