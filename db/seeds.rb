# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ny = Destination.create(location:"ny", start_date:"1000-01-02", end_date:"1111-11-03")
hot = Weather.create(fahrenheit: 45)
ny.travel_dates.create(current_date:"3453-02-02", weather_id: hot.id)
