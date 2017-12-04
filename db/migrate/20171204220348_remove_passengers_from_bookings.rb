class RemovePassengersFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_reference :bookings, :passenger, foreign_key: true
  end
end
