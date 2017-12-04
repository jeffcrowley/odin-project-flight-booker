class AddArrivalTimeToFlights < ActiveRecord::Migration[5.0]
  def change
    add_column :flights, :arrival_time, :datetime
  end
end
