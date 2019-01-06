# frozen_string_literal: true

# Service class for connecting to the Data USA API
class DataUsaService
  def city_results(query)
    fetch_json("/attrs/search/?q=#{query}&kind=geo")
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
end
