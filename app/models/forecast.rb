require 'Date'

class Forecast
	attr_reader :latitude, :longitude, :time, :forecast

	def initialize(location)
		ForecastIO.api_key = ENV["forecastio"]
		ForecastIO.default_params = {unit: "us"}
		@latitude = location[:latitude]
		@longitude = location[:longitude]
		@time = Date.parse(location[:date]).to_time.to_i
		@forecast = ForecastIO.forecast(latitude, longitude, time: self.time)
	end

	def current_weather
		forecast.currently.temperature
	end

	def apparent_temperature
		forecast.currently.apparentTemperature
	end

	def precipation_type
		forecast.currently.precipType
	end

	def summary
		forecast.currently.summary
	end
end
