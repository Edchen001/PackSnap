class TripsController < ActionController::Base

	def index
		@trips = Trip.all
		render :index, locals:(trips: @trips)
	end

	def show
		@trip = Trip.find(params[:id])
	end

	def new
		@trip = Trip.new
		render :new, locals:{trip: @trip}
	end

	def create
		@trip = Trip.new
		@trip.assign_attributes(trip_params)
		if @trip.save
			redirect_to trip_path(@trip)
		else
			redirect_to new_trip_path(@trip)
		end
	end


	def edit
		@trip = Trip.find(params[:id])
		render :edit, locals:{trip: @trip}
	end


	def update
		@trip = Trip.find(params[:id])
		@trip.assign_attributes(trip_params)
		if @trip.save
			redirect_to trip_path(@trip)
		else
			redirect_to edit_trip_path(@trip)
		end
	end

	def destroy
		@trip = Trip.find(params[:id])
		@trip.delete
		redirect_to trips_path
	end

	private
	def trip_params
		params.require(:trip).permit(:title,:description)
	end
end
