class LocationsController < ApplicationController
  def new
    @location = Location.new()
    render :new, locals:{location: @location}
  end

  def create
    itinerary_id = flash[:itinerary_id]
    attributes = location_params

    weather = get_weather(attributes)
    scope = get_weather_scope(weather)
    suggest_items = get_suggest_item(scope)

    @coordinate = Coordinate.find_or_create_by(latitude: attributes[:latitude], longitude: attributes[:longitude])
    @location = Location.new(itinerary_id: itinerary_id, address: attributes[:address], coordinate_id: @coordinate.id)

    respond_to do |format|
      if @location.save
        format.html { render partial: "locations/test", locals:{suggest_items: suggest_items, location: @location} }
      else
        set_alert(@location)
        format.html { render :new, locals:{location: @location} }
      end
    end
  end

  private

  def location_params
    params.require(:coordinate).permit(:address, :latitude, :longitude)
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