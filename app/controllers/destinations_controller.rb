class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
    render :index, locals:{destinations: @destinations}
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def new
    @destination = Destination.new
    render :new, locals:{destination: @destination}
  end

  def create
    @destination = Destination.new
    @destination.assign_attributes(destination_params)
    if @destination.save
      redirect_to destination_path(@destination)
    else
      redirect_to new_destination_path(@destination)
    end
  end

  def edit
    @destination = Destination.find(params[:id])
    render :edit, locals:{destination: @destination}
  end

  def update
    @destination = Destination.find(params[:id])
    @destination.assign_attributes(destination_params)
    if @destination.save
      redirect_to destination_path(@destination)
    else
      redirect_to edit_destination_path(@destination)
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.delete
    redirect_to destinations_path
  end

  private

  def destination_params
    params.require(:destination).permit(:location,:start_date, :end_date)
  end
end