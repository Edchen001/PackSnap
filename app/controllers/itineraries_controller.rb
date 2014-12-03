class ItinerariesController < ApplicationController
  def index
    # OK, just on the basic gut feel of it  if i give you a pizza_id, you're
    # expecting to find a pizza.  If I give you car_id, you expect to find a
    # car, right?  So here you take a trip_id to find an Itinerary?
    #
    # something smells here and I'm not sure what, but this hints at something
    # wrong
    @itineraries = Itinerary.where(trip_id: params[:trip_id])
    render :index, locals:{trip: @trip, itineraries: @itineraries}
  end

  def show
    @itinerary = find_itinerary
    render :show, locals:{itinerary: @itinerary}
  end

  def new
    @user = User.new
    @itinerary = Itinerary.new(trip_id: params[:trip_id])
    # You shouldn't need this, html is the defaul responder
    respond_to do |format|
      format.html { render partial: "itineraries/form_itinerary", locals:{itinerary: @itinerary} }
    end
  end

  def create
    @itinerary = Itinerary.new(trip_id: params[:trip_id])
    @itinerary.assign_attributes(itinerary_params)
    @location = Location.new
    respond_to do |format|
      if @itinerary.save
        flash[:itinerary_id] = @itinerary.id
        format.html { render template: "locations/new", layout: false, locals:{location: @location} }
      else
        set_alert(@itinerary)
        format.html { render :new, locals:{itinerary: @itinerary} }
      end
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
