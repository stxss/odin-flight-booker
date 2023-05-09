class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to root_path, notice: "Your flight is booked!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end
