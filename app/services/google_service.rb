# frozen_string_literal: true

# Service for handling Google API requests
class GoogleService
  include Connectable

  def initialize
    @base_url = 'https://maps.googleapis.com'
  end

  def airport_lookup(coordinates)
    fetch_json("/maps/api/place/nearbysearch/json?key=#{ENV['GOOGLE_MAPS_KEY']}&location=#{coordinates[:lat]},#{coordinates[:lng]}&radius=50000&keyword=airport&type=airport&rankby=prominence")
  end  

  def lat_long(city_name)
    fetch_json("/maps/api/geocode/json?address=#{city_name}&key=#{ENV['GOOGLE_MAPS_KEY']}")
  end

  def airport_distance(origin, destination)
    fetch_json("/maps/api/directions/json?key=#{ENV['GOOGLE_MAPS_KEY']}&origin=#{origin[:lat]},#{origin[:lng]}&destination=#{destination[:lat]},#{destination[:lng]}")
  end

  private

  attr_reader :base_url
end
