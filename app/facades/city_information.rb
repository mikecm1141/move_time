# frozen_string_literal: true

# Facade for the City Show pages
class CityInformation
  include Serviceable
  include TransportData
  include EthnicityData

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def name
    city_information[:display_name]
  end

  def info_year
    city_data[:year]
  end

  def population
    city_data[:pop]
  end

  def median_age
    city_data[:age]
  end

  def mean_commute_minutes
    city_data[:mean_commute_minutes]&.ceil || 'N/A'
  end

  def median_household_income
    city_data[:income]
  end

  def median_property_value
    city_data[:median_property_value]
  end

  def pop_rank
    city_data[:pop_rank].to_i
  end

  def income_rank
    city_data[:income_rank].to_i
  end

  private

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
