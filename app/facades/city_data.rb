# frozen_string_literal: true

# Module for City Data
module CityData
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
end
