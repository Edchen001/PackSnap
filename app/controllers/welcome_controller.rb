class WelcomeController < ApplicationController
  def index
    @user = User.new
  end
  def dash
    @users = get_users(params[:coordinate])

    weather = get_weather(params[:coordinate])
    scope = get_weather_scope(weather)
    suggest_items = get_suggest_item(scope)

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

  def get_weather_scope(weather)
    Scope.find_by("minimum <= #{weather} and maximum >= #{weather}")
  end

  def get_suggest_item(scope)
    scope.category.items
  end
end