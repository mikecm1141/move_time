# frozen_string_literal: true

# Service class for connecting to the Teleport API
class TeleportService
  def city_results(query)
    fetch_json("/api/cities/?search=#{query}")
  end

  private

  def conn
    Faraday.new(url: 'https://api.teleport.org') do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
