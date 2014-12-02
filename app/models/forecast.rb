class Forecast
	attr_reader :latitude, :longitude, :time, :forecast, :seven_day_forecast

	def initialize(coordinate)
		ForecastIO.api_key = "3fac0b4fad926d110405e9ff06c240c9"
		@latitude = coordinate[:latitude]
		@longitude = coordinate[:longitude]
		@time = Time.new(coordinate[:date]).to_i
		@forecast = find_forecast
		
		@precipitation_type = 
		@seven_day_forecast = getSevenDayForecast
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