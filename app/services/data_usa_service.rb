# frozen_string_literal: true

# Service class for connecting to the Data USA API
class DataUsaService
  def city_results(query)
    fetch_json("/attrs/search/?kind=geo&q=#{query}")
  end

  def city_data(geo_id)
    fetch_json("/api/?geo=#{geo_id}&#{city_acs_url}&force=acs.yg")
  end

  def city_information(geo_id)
    fetch_json("/attrs/geo/#{geo_id}/")
  end

  def transport_data(geo_id)
    fetch_json("/api/?geo=#{geo_id}&#{city_acs_url}&force=acs.yg_transport")
  end

  def ethnicity_data(geo_id)
    fetch_json("/api/?geo=#{geo_id}&#{city_acs_url}&force=acs.yg_race")
  end

  private

  def conn
    Faraday.new(url: 'https://api.datausa.io') do |faraday|
      faraday.request :url_encoded
      faraday.use Faraday::HttpCache, store: Rails.cache, serializer: Marshal
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def city_acs_url
    'show=geo&sumlevel=place&year=latest'
  end
end
