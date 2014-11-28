require 'csv'
require 'date'

# first = Trip.create(title: "TRIP 1")

# iti_first = first.itineraries.create(start_date:"1000-01-02", end_date:"1111-11-03")

# Weather.create(fahrenheit: 45)

# iti_first.travel_dates.create(current_date:"3453-02-02", weather_id: Weather.first.id)

# # Destination.create(location:"ny", start_date:"1000-01-02", end_date:"1111-11-03")
# # Weather.create(fahrenheit: 45)
# # Destination.first.travel_dates.create(current_date:"3453-02-02", weather_id: Weather.first.id)

# ClimateType.create(code: 'Af', name: 'Tropical rainforest climate', description: 'hot and wet')

# File.open('../app/assets/kg.txt') { |f| f.each_line { |l| l.split(/\s+/) } }


CSV.foreach('app/assets/data_files/climates2.csv', headers: true, header_converters: :symbol, converters: :all) do |csv|
	ClimateType.create(csv.to_hash)
end
