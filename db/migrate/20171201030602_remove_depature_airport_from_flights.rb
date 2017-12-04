class RemoveDepatureAirportFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_reference :flights, :depature_airport, foreign_key: true
  end
end
