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
    respond_to do |format|
      if @location.save
        format.html { render partial: "trips/single_trip", locals:{trip: @location.itinerary.trip} }
      else
        set_alert(@location)
        format.html { render :new, locals:{location: @location} }
      end
    end
  end

  private

  def location_params
    params.require(:geoInfo).permit(:address, :latitude, :longitude)
  end
end