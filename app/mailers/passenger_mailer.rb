class PassengerMailer < ApplicationMailer

  default from: "flightbooker@example.io"

  def thank_you_email(passenger)
   @passenger = passenger
    mail(to: @passenger.email, subject: 'Thanks for booking your flight!')
  end
end
