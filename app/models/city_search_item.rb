# frozen_string_literal: true

# The class for a city as a search item
class CitySearchItem
  attr_reader :name

  def initialize(city_data)
    @name = city_data[:matching_full_name]
    @link = city_data[:'_links'][:'city:item'][:href]
  end

  def id
    link.scan(/\d/).join
  end

  private

  attr_reader :link
end
