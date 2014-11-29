class WelcomeController < ApplicationController
  def index

  end

  def dash
    @users = get_users(coordinate)
    render :dash, locals:{users: @users}
  end

  private

  def inputted_destinations(coordinate)
    coordinate = Coordinate.find_by(longitude: coordinate[:longitude], latitude: coordinate[:latitude])
    coordinate.destinations
  end

  def get_users(coordinate)
    inputted_destinations(coordinate).map { |destination| destination.user }
  end
end