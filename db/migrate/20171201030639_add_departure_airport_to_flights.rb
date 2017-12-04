class AddDepartureAirportToFlights < ActiveRecord::Migration[5.0]
  def change
    add_reference :flights, :departure_airport, foreign_key: true
  end
end
