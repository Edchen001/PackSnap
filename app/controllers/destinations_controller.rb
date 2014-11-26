class DestinationsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @destinations = @trip.destinations
    render :index, locals:{destinations: @destinations}
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @destination = @trip.destinations.find(params[:id])
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @destination = Destination.new(trip: @trip)
    render :new, locals:{destination: @destination}
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @destination = @trip.destinations.new(trip: @trip)
    @destination.assign_attributes(destination_params)
    if @destination.save!
      redirect_to trip_destination_path([@trip,@destination])
    else
      redirect_to new_trip_destination_path
    end
  end

  def edit
    @destination = Destination.find(params[:id])
    render :edit, locals:{destination: @destination}
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @destination = @trip.destinations.find(params[:id])
    @destination.assign_attributes(destination_params)
    if @destination.save
      redirect_to trip_destination_path([@trip,@destination])
    else
      redirect_to edit_trip_destination_path(@destination)
    end
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @destination = @trip.destinations.find(params[:id])
    @destination.delete
    redirect_to destinations_path
  end

  private

  def destination_params
    params.require(:destination).permit(:location,:start_date, :end_date, :trip_id)
  end
end