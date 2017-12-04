class RemoveArrivalDateFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :arrival_date, :string
    remove_column :flights, :datetime, :string
  end
end
