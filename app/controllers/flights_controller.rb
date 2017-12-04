class FlightsController < ApplicationController

  def index
   @flights = Flight.search(params)
   @airports = Airport.pluck(:abbreviation, :id).sort #array of airports, sorted by name and abbreviation
   @passengers = (1..4).map.sort #array of passengers, from 1-4
   @departure_dates = Flight.pluck(:departure_date).map { |d| d.strftime('%D') }.uniq.sort #Flight datetimes, condensed to just dates, non-repeating, sorted
   @arrival_dates = Flight.pluck(:arrival_date).map { |d| d.to_date }.uniq.sort #Flight datetimes, condensed to just dates, non-repeating, sorted
  end

end
