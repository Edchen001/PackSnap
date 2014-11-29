class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.where(trip_id: params[:trip_id])
    render :index, locals:{trip: @trip, itineraries: @itineraries}
  end

  def show
    @itinerary = find_itinerary
    render :show, locals:{itinerary: @itinerary}
  end

  def new
    @itinerary = Itinerary.new(trip_id: params[:trip_id])
    render :new, locals:{itinerary: @itinerary}
  end

  def create
    @itinerary = Itinerary.new(trip_id: params[:trip_id])
    @itinerary.assign_attributes(itinerary_params)
    if @itinerary.save
      p session[:itinerary_id] = @itinerary.id

      redirect_to new_location_path
    else
      set_alert(@itinerary)
      render :new, locals:{itinerary: @itinerary}
    end
  end

  def edit
    @itinerary = find_itinerary
    render :edit, locals:{itinerary: @itinerary}
  end

  def update
    @itinerary = find_itinerary
    @itinerary.assign_attributes(itinerary_params)
    if @itinerary.save
      redirect_to trip_itineraries_path(@itinerary.trip)
    else
      set_alert(@itinerary)
      render :edit, locals:{itinerary: @itinerary}
    end
  end

  def destroy
    @itinerary = find_itinerary
    @itinerary.delete
    redirect_to trip_itineraries_path(@itinerary.trip)
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:start_date, :end_date, :trip_id)
  end

  def find_itinerary
    Itinerary.find_by(trip_id: params[:trip_id])
  end

end