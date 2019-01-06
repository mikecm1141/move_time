# frozen_string_literal: true

# Module for API Services
module Serviceable
  private

  def data_usa_service
    DataUsaService.new
  end

  def hashed_data(json_hash)
    json_hash[:data].map do |city|
      json_hash[:headers].zip(city).to_h.symbolize_keys
    end
  end
end
