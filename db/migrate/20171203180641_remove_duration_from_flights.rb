class RemoveDurationFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :duration, :datetime
  end
end
