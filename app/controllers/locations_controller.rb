class LocationsController < ApplicationController
  def new
    @location = Location.new()
    render :new, locals:{location: @location}
  end

  def create
    itinerary_id = flash[:itinerary_id]
    attributes = location_params
    @coordinate = Coordinate.find_or_create_by(latitude: attributes[:latitude], longitude: attributes[:longitude])
    @location = Location.new(itinerary_id: itinerary_id, address: attributes[:address], coordinate_id: @coordinate.id)
    if @location.save
      flash[:itinerary_id] = nil
    if @location.save!
      redirect_to trip_itinerary_path(@location.itinerary.trip, @location.itinerary)
    else
      set_alert(@location)
      render :new, locals:{location: @location}
    end
  end

  private

  def location_params
    params.require(:geoInfo).permit(:address, :latitude, :longitude)
  end
end