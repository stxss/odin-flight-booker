class PassengerMailer < ApplicationMailer
  default from: 'flight@booker.com'

  def confirm_booking
    @passenger = params[:passenger]
    @url  = 'http://localhost:3000/welcome'
    mail(to: email_address_with_name(@passenger.email, @passenger.name), subject: 'Flight confirmation')
  end
end
