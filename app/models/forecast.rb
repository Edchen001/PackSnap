class Forecast
	attr_reader :latitude, :longitude, :time, :forecast

	def initialize(location)
		ForecastIO.api_key = ENV["forecastio"]
		@latitude = location[:latitude]
		@longitude = location[:longitude]
		@time = Time.new(location[:date]).to_i
		@forecast = find_forecast
	end

	def find_forecast
		ForecastIO.forecast(self.latitude, self.longitude)
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
