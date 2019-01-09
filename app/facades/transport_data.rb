# frozen_string_literal: true

# Module for all transport data methods
module TransportData
  def transport_hash
    {
      Bicycle: bicycle_transport,
      Carpool: carpool_transport,
      Alone:   alone_transport,
      Motorcycle: motorcycle_transport,
      'Public Transport,ation': public_transport,
      Taxi: taxi_transport,
      Walking: walking_transport,
      'Work From Home': home_workers
    }
  end

  def bicycle_transport
    transport_data[:transport_bicycle]&.ceil
  end

  def carpool_transport
    transport_data[:transport_carpooled]&.ceil
  end

  def alone_transport
    transport_data[:transport_drove]&.ceil
  end

  def motorcycle_transport
    transport_data[:transport_motorcycle]&.ceil
  end

  def public_transport
    transport_data[:transport_publictrans]&.ceil
  end

  def taxi_transport
    transport_data[:transport_taxi]&.ceil
  end

  def walking_transport
    transport_data[:transport_walked]&.ceil
  end

  def total_workers
    transport_data[:workers]&.ceil
  end

  def home_workers
    transport_data[:transport_home]&.ceil
  end
end
