# frozen_string_literal: true

# Service class for connecting to the Data USA API
class DataUsaService
  def city_results(query)
    fetch_json("/attrs/search/?q=#{query}&kind=geo")
  end

  def city_data(geo_id)
    fetch_json("/api/?geo=#{geo_id}&#{city_acs_url}")
  end

  def city_information(geo_id)
    fetch_json("/attrs/geo/#{geo_id}/")
  end

  private

  def conn
    Faraday.new(url: 'https://api.datausa.io') do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def city_acs_url
    'show=geo&sumlevel=place&force=acs.yg&year=latest'
  end
end
