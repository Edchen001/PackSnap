class ItinerariesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @itineraries = @trip.itineraries
    render :index, locals:{trip: @trip, itineraries: @itineraries}
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @itinerary = @trip.itineraries.find(params[:id])
    render :show, locals:{itinerary: @itinerary}
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @itinerary = Itinerary.new(trip: @trip)
    render :new, locals:{itinerary: @itinerary}
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @itinerary = @trip.itineraries.build(trip: @trip)
    @itinerary.assign_attributes(itinerary_params)
    if @itinerary.save
      redirect_to trip_itineraries_path(@trip)
    else
      set_alert(@itinerary)
      render :new, locals:{itinerary: @itinerary}
    end
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @itinerary = @trip.itineraries.find(params[:id])
    render :edit, locals:{itinerary: @itinerary}
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @itinerary = @trip.itineraries.find(params[:id])
    @itinerary.assign_attributes(itinerary_params)
    if @itinerary.save
      redirect_to trip_itineraries_path(@trip)
    else
      set_alert(@itinerary)
      render :edit, locals:{itinerary: @itinerary}
    end
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @itinerary = @trip.itineraries.find(params[:id])
    @itinerary.delete
    redirect_to trip_itineraries_path(@trip)
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:start_date, :end_date, :trip_id)
  end

end