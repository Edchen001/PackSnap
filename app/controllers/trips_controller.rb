class TripsController < ApplicationController

	def index
		@trips = Trip.all
		render :index, locals:{trips: @trips}
	end

	def show
		@trip = Trip.find(params[:id])
		render :show, locals:{trip: @trip}
	end

	def new
		@trip = Trip.new
		render :new, locals:{trip: @trip}
	end

	def create
		@trip = Trip.new(user_id: session[:user_id])
		@trip.assign_attributes(trip_params)
		respond_to do |format|
			if @trip.save
				format.html { render partial: "trips/single_trip", locals:{trip: @trip} }
			else
				set_alert(@trip)
				format.html { render :new, locals:{trip: @trip} }
			end
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
			set_alert(@trip)
			render :edit, locals:{trip: @trip}
		end
	end

	def destroy
		@trip = Trip.find(params[:id])
		@trip.delete
		redirect_to trips_path
	end

	private

	def trip_params
		params.require(:trip).permit(:title,:description, :user_id, :bag)
	end
end
