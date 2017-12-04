class RemoveArrivalTimeFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :arrival_time, :datetime
  end
end
