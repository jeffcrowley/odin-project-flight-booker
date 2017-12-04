class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id'
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'

  def duration
   duration = self.arrival_date - self.departure_date #seconds
   Time.at(duration).utc.strftime("%Hh:%Mm") #converts seconds to hours/minutes, source: https://gist.github.com/shunchu/3175001
  end

  def self.search(params) #need self when calling Flight.search, as opposed to an instance of Flight, in which you wouldn't need self
   if params_exist(params) == true
      date = DateTime.strptime(params[:date], '%D')
      date_search_range = date.beginning_of_day..date.end_of_day
      Flight.where(arrival_airport_id: params[:to], departure_airport_id: params[:from], departure_date: date_search_range) #you can't just use params[:date], since it's a string, and not a DateTime, so you need to create a range of DateTimes, based off that string. Otherwise, search will never turn up any flights.
   else
      Flight.none
   end
  end

def self.params_exist(params)
   if params[:from] && params[:to] && params[:date] && params[:passengers]
      true
   else
      false
   end
end

end
