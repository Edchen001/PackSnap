class DashController < ApplicationController

  def index
    @user = User.new

    client = init_forecast_client(params[:location])

    weather = get_weather
    scope = get_weather_scope(weather)
    suggest_items = unique_item(scope)

    render :dashboard, locals:{users: @users, items: suggest_items, latitude: params[:location][:latitude], longitude: params[:location][:longitude], address: params[:location][:address]}, layout: false
  end

  def new
    @item = Item.new
    render :new
  end

  def create
    @user = User.find(session[:user_id])
    @location = Location.find_or_create_by(location_params)
    @item = Item.new(location: @location)
    @comment = Comment.new(user: @user, location: @location, item: @item)
    @comment.assign_attributes(comment_params)
    @item.assign_attributes(item_params)

    if !@item.save!
      flash[:error] = @item.errors.full_messages
    elsif !@comment.save!
      flash[:error] = @comment.errors.full_messages
    else
      flash[:success] = "success!"
    end

    render :index

  end

  attr_reader :forecast_client

  def init_forecast_client(location)
    @forecast_client = Forecast.new(location)
  end

  def get_weather
    self.forecast_client.weather
  end

  def get_precipitation_type
    self.forecast_client.precipationType
  end

  def get_weather_scope(weather)
    Scope.find_by("minimum <= #{weather} and maximum >= #{weather}")
  end

  def get_suggested_weather_items(scope)
    scope.category.items
  end

  def get_suggested_precipation_type_item
    precipation_type = Category.where(name: self.get_precipitation_type)
    unless precipation_type
      return precipation_type.items
    else
      return []
    end
  end

  def unique_item(scope)
    items = get_suggested_weather_items(scope) + get_suggested_precipation_type_item
    items.uniq
  end

  private

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude)
  end

  def item_params
    params.require(:item).permit(:name, :description, :image, :user_id)
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end