class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
    else
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end

end