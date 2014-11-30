class WelcomeController < ApplicationController
  def index
    @user = User.new
  end
  def dash
    @users = get_users(params[:coordinate])
    respond_to do |format|
      format.html { render partial: "welcome/dash", locals:{users: @users}  }
    end
  end

  private

  def inputted_destinations(coordinate)
    coordinate = Coordinate.find_or_create_by(longitude: coordinate[:longitude], latitude: coordinate[:latitude])
    coordinate.locations
  end

  def get_users(coordinate)
    inputted_destinations(coordinate).map { |destination| destination.user }
  end
end