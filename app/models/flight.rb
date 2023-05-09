class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  has_many :passengers
  has_many :bookings

  def self.return_flights(params)
    where(departure_airport_id: params[:departure_airport_id],
      arrival_airport_id: params[:arrival_airport_id],
      departure_date: params[:departure_date])
  end

  def info
      "From #{Airport.find(departure_airport_id).city}, #{Airport.find(departure_airport_id).code} to #{Airport.find(arrival_airport_id).city}, #{Airport.find(arrival_airport_id).code}. Departure on #{departure_date} at #{departure_time.strftime("%H:%M")}. Total flight duration is #{(departure_time + duration).strftime("%Hh%Mm")}"
  end
end
