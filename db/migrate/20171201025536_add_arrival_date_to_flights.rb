class AddArrivalDateToFlights < ActiveRecord::Migration[5.0]
  def change
    add_column :flights, :arrival_date, :datetime
  end
end
