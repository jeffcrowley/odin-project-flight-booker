class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.references :depature_airport, foreign_key: true
      t.references :arrival_airport, foreign_key: true
      t.integer :flight_num
      t.float :price
      t.datetime :departure_date
      t.datetime :arrival_date
      t.datetime :duration

      t.timestamps
    end
  end
end
