class BookingsController < ApplicationController
  def new
    @booking = Passenger.new
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_id)
  end
end
