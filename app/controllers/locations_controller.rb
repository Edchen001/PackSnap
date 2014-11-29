class LocationsController < ApplicationController
  def new
    @location = Location.new(itinerary_id: session[:itinerary_id])
    render :new, locals:{location: @location}
  end
  def create
    p location_params
    # raise (params);
    @location = Location.new(itinerary_id: session[:itinerary_id])
    @location.assign_attributes(location_params)
    if @location.save
      session[:itinerary_id] = nil
      redirect_to trip_itinerary_path(@location.itinerary.trip, @location.itinerary)
    else
      set_alert(@location)
      render :new, locals:{location: @location}
    end
  end

  def location_params
    params.require(:geoInfo).permit(:address)
  end
end