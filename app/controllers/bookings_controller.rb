class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @passenger = booking_params[:passengers_attributes]
    respond_to do |format|
      if @booking.save
        Passenger.where(booking_id: @booking).each do |passenger|
          PassengerMailer.with(passenger: passenger).confirm_booking.deliver_now!
        end
        format.html { redirect_to @booking, notice: "Your flight is booked!" }
        format.json { render json: @passenger, status: :created, location: @passenger }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
end
