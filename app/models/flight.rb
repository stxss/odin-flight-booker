class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def self.return_flights(params)
    where(departure_airport_id: params[:departure_airport_id],
      arrival_airport_id: params[:arrival_airport_id],
      departure_date: params[:departure_date])
  end
end
