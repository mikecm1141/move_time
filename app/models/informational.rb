# frozen_string_literal: true

# Module for extending models
module Informational
  include Serviceable

  private

  def external_data
    @external_data ||= hashed_data(data_usa_service.city_information(geo_id))[0]
  end
end
