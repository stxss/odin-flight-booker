class FlightsController < ApplicationController
  def index
    @search_flights = Flight.all.return_flights(search_params)
  end

  private

  def search_params
    params.permit(:departure_airport_id, :arrival_airport_id, :departure_date, :passenger_num, :commit)
  end
end
