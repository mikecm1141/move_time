# frozen_string_literal: true

# Facade for the City Show pages
class CityInformation
  include Serviceable

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def name
    city_information[:display_name]
  end

  def population
    city_data[:pop]
  end

  private

  def city_information
    @city_information ||= hashed_data(data_usa_service.city_information(id))[0]
  end

  def city_data
    @city_data ||= hashed_data(data_usa_service.city_data(id))[0]
  end
end
