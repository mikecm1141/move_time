# frozen_string_literal: true

# Facade for the City Show pages
class CityInformation
  include Serviceable

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def name
    basic_data[:name]
  end

  def population
    basic_data[:population]
  end

  private

  def basic_data
    @basic_data ||= teleport_service.basic_city_data(id)
  end
end
