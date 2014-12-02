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
		ForecastIO.forecast(self.latitude, self.longitude, time: self.time)
	end

	def weather
		self.forecast.currently.temperature
	end

	def apparentTemperature
		self.forecast.currently.apparentTemperature
	end

	def precipationType
		self.forecast.currently.precipType
	end

	def summary
		self.forecast.currently.summary
	end

	def getSevenDayForecast
		self.forecast.daily.data
	end

end