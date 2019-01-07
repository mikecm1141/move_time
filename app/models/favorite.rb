class Favorite < ApplicationRecord
  include Serviceable

  belongs_to :user

  default_scope { where(active: true) }

  def name
    external_data[:display_name]
  end

  def slug
    external_data[:url_name]
  end

  private

  def external_data
    @external_data ||= hashed_data(data_usa_service.city_information(geo_id))[0]
  end
end
