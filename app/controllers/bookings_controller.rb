class BookingsController < ApplicationController
  def new
   @flight = Flight.find(params[:flight_id])
   @booking = @flight.bookings.build
   @passenger_count = params[:passengers].to_i

   @passenger_count.times { @booking.passengers.build } # builds new passengers based off the number of passengers selected
   @booking.passengers.build if params[:passengers].blank? # if passengers entered was blank, this will create 1 passenger for the booking by default
  end

  def create
   @booking = Booking.new(booking_params)
   if @booking.save
      @booking.passengers.each { |passenger| PassengerMailer.thank_you_email(passenger).deliver_now!}
      redirect_to @booking
   else
      render 'new'
   end
  end

  def show
   @booking = Booking.find(params[:id])
   @flight = @booking.flight
   @passengers = @booking.passengers
  end
end


private

def booking_params
   params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
end
