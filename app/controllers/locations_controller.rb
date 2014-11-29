class LocationsController < ApplicationController
  def new
    @location = Location.new(itinerary_id: session[:itinerary_id])
    render :new, locals:{location: @location}
  end
  def create
    puts "*" * 50
    p session[:itinerary_id]
    attributes = location_params
    @coordinate = Coordinate.find_or_create_by(latitude:attributes[:latitude], longitude: attributes[:longitude])
    @location = Location.new(itinerary_id: session[:itinerary_id], address: attributes[:address], coordinate_id: @coordinate.id)
    if @location.save
      session[:itinerary_id] = nil
      redirect_to trip_itinerary_path(@location.itinerary.trip, @location.itinerary)
    else
      set_alert(@location)
      render :new, locals:{location: @location}
    end
  end

  def location_params
    params.require(:geoInfo).permit(:address, :latitude, :longitude)
  end
end