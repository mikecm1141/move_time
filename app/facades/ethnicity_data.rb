module EthnicityData
  def eth_native
    ethnicity_data[:pop_native]&.ceil
  end

  def eth_black
    ethnicity_data[:pop_black]&.ceil
  end

  def eth_white
    ethnicity_data[:pop_white]&.ceil
  end

  def eth_asian
    ethnicity_data[:pop_asian]&.ceil
  end

  def eth_pacific
    ethnicity_data[:pop_hawaiian]&.ceil
  end

  def eth_other
    ethnicity_data[:pop_other]&.ceil
  end

  def eth_two_or_more
    ethnicity_data[:pop_2ormore]&.ceil
  end

  def eth_latino
    ethnicity_data[:pop_latino]&.ceil
  end
end
