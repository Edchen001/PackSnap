class LocationsController < ApplicationController
  def new
    @location = Location.new(itinerary_id: session[:itinerary_id])
    render :new, locals:{location: @location}
  end
  def create
   
    attributes = location_params
    p session[:itinerary_id]
    @coordinate = Coordinate.find_or_create_by(latitude:attributes[:latitude], longitude: attributes[:longitude])
    @location = Location.new(itinerary_id: session[:itinerary_id], address: attributes[:address], coordinate_id: @coordinate.id)
    if @location.save
      p "*"*100
      p @location.itinerary.trip
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