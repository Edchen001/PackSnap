class Forecast
	def self.print()
		puts "I do exist"
	end
	attr_reader :latitude, :longitude, :forecast, :seven_day_forecast

	def initialize(coordinate)
		ForecastIO.api_key = "3fac0b4fad926d110405e9ff06c240c9"
		@latitude = coordinate[:latitude]
		@longitude = coordinate[:longitude]
		@forecast = find_forecast
		@seven_day_forecast = get_seven_day_forecast
	end

	def find_forecast
		ForecastIO.forecast(self.latitude, self.longitude)		
		# 331300800
	end

	def weather
		self.forecast.currently
	end

	def apparentTemperature
		self.forecast.currently.apparentTemperature
	end 

	def summary
		self.forecast.currently.summary
	end 

	def get_seven_day_forecast
		self.forecast.daily.data
	end

end