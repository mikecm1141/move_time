# frozen_string_literal: true

# Module for services
module Connectable
  private

  def conn
    Faraday.new(url: base_url) do |faraday|
      faraday.request :url_encoded
      faraday.use Faraday::HttpCache, store: Rails.cache, serializer: Marshal
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
