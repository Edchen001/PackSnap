class Forecast
	attr_reader :latitude, :longitude, :time, :forecast, :seven_day_forecast

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

	def weather
		self.forecast.currently.temperature
	end

	def apparent_temperature
		self.forecast.currently.apparentTemperature
	end

	def precipation_type
		self.forecast.currently.precipType
	end

	def summary
		self.forecast.currently.summary
	end

end