class WelcomeController < ApplicationController
  def index
    @user = User.new
  end
  def dash
    @users = get_users(params[:coordinate])

    weather = get_weather(params[:coordinate])
    scope = get_weather_scope(weather)
    suggest_items = unique_item(scope)

    respond_to do |format|
      format.html { render partial: "welcome/dash", locals:{users: @users, items: suggest_items}  }
    end
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

  def get_weather(coordinate)
    Forecast.new(coordinate).weather
  end

  def get_precipitation_type(coordinate)
    Forecast.new(coordinate).precipationType
  end

  def get_weather_scope(weather)
    Scope.find_by("minimum <= #{weather} and maximum >= #{weather}")
  end

  def get_suggested_weather_item(scope)
    scope.category.items
  end

  def get_suggested_precipation_type_item
    precipation_type = Category.where(name: get_precipitation_type)
    unless precipation_type
      return precipation_type.items
    else
      return []
    end 
  end

  def unique_item(scope)
    items =get_suggested_weather_items(scope) + get_suggested_precipation_type_item
    items.uniq
  end
end