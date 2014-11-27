# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
first = Trip.create(title: "TRIP 1")

iti_first = first.itineraries.create(start_date:"1000-01-02", end_date:"1111-11-03")

Weather.create(fahrenheit: 45)

iti_first.travel_dates.create(current_date:"3453-02-02", weather_id: Weather.first.id)

# Destination.create(location:"ny", start_date:"1000-01-02", end_date:"1111-11-03")
# Weather.create(fahrenheit: 45)
# Destination.first.travel_dates.create(current_date:"3453-02-02", weather_id: Weather.first.id)

ClimateType.create(code: 'Af', type: 'Tropical rainforest climate', description: 'hot and wet')

File.open('../app/assets/kg.txt') { |f| f.each_line { |l| l.split(/\s+/) } }
