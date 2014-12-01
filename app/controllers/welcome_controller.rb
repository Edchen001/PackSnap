class WelcomeController < ApplicationController
  def index
    @user = User.new
  end

  def dash
    @users = get_users(params[:coordinate])

    client = init_forecast_client(params[:coordinate])

    weather = get_weather
    scope = get_weather_scope(weather)
    suggest_items = unique_item(scope)

    respond_to do |format|
      format.html { render partial: "welcome/dash", locals:{users: @users, items: suggest_items}  }
    end
  end

  attr_reader :forecast_client

  def init_forecast_client(coordinate)
    @forecast_client = Forecast.new(coordinate)
  end

  def get_weather
    self.forecast_client.weather
  end

  def get_precipitation_type
    self.forecast_client.precipationType
  end

  def get_weather_scope(weather)
    Scope.find_by("minimum <= #{weather} and maximum >= #{weather}")
  end

  def get_suggested_weather_items(scope)
    scope.category.items
  end

  def get_suggested_precipation_type_item
    precipation_type = Category.where(name: self.get_precipitation_type)
    unless precipation_type
      return precipation_type.items
    else
      return []
    end
  end

  def unique_item(scope)
    items = get_suggested_weather_items(scope) + get_suggested_precipation_type_item
    items.uniq
  end

  private

  def inputted_destinations(coordinate)
    coordinate = Coordinate.find_or_create_by(longitude: coordinate[:longitude], latitude: coordinate[:latitude])
    coordinate.locations
  end

  def get_users(coordinate)
    itineraries = inputted_destinations(coordinate).map { |destination| destination.itinerary }
    trips = itineraries.map { |itinerary| itinerary.trip }
    trips.map { |trip| trip.user }
  end

  def location_params
    params.require(:coordinate).permit(:address, :latitude, :longitude, :date)
  end

end