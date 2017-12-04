5.times do |x|
   name = Faker::Address.city
   abbreviation = Faker::Address.country_code + "Q"

   Airport.create(name: name, abbreviation: abbreviation)
end

airports = Airport.all

500.times do |x|

   departure_airport = airports.sample
   arrival_airport = airports.sample

   until arrival_airport != departure_airport
      arrival_airport = airports.sample
   end

   flight_num = Faker::Number.number(4)
   price = Faker::Number.decimal(3, 2)
   departure_date = Faker::Time.between(4.hours.from_now, 5.days.from_now)
   arrival_date = Faker::Time.between(departure_date + 6.hours, departure_date + 13.hours)

   Flight.create(departure_airport_id: departure_airport.id,
                     arrival_airport_id: arrival_airport.id,
                     flight_num: flight_num,
                     price: price,
                     departure_date: departure_date,
                     arrival_date: arrival_date)

   end


