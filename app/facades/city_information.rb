# frozen_string_literal: true

# Facade for the City Show pages
class CityInformation
  include Serviceable
  include TransportData
  include EthnicityData
  include CityData

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def name
    city_information[:display_name]
  end

  def airport_distance
    airport_directions[:routes][0][:legs][0][:distance][:text]
  end

  def airport_time
    airport_directions[:routes][0][:legs][0][:duration][:text]
  end

  def airport_name
    find_closest_airport[:results][0][:name]
  end

  private

  def coordinates
    google_service.lat_long(name)[:results][0][:geometry][:location]
  end

  def airport_coords
    find_closest_airport[:results][0][:geometry][:location]
  end

  def airport_directions
    @airport_directions ||=  google_service.airport_distance(coordinates, airport_coords)
  end

  def find_closest_airport
    @find_closest_airport ||= google_service.airport_lookup(coordinates)
  end

  def city_information
    @city_information ||= hashed_data(data_usa_service.city_information(id))[0]
  end

  def city_data
    @city_data ||= hashed_data(data_usa_service.city_data(id))[0]
  end

  def transport_data
    @transport_data ||= hashed_data(data_usa_service.transport_data(id))[0]
  end

  def ethnicity_data
    @ethnicity_data ||= hashed_data(data_usa_service.ethnicity_data(id))[0]
  end
end
