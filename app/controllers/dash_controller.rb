class DashController < ApplicationController

  def index
    @user = User.new

    @client = Forecast.new(params[:coordinate])

    weather = @client.weather
    scope = get_weather_scope(weather)
    suggest_items = unique_item(scope)

    respond_to do |format|
      format.html { render :index, locals:{users: @users, items: suggest_items} }
    end
  end


  def get_weather_scope(weather)
    Scope.find_by("minimum <= #{weather} and maximum >= #{weather}")
  end

  def get_suggested_weather_items(scope)
    scope.category.items
  end

  def get_suggested_precipation_type_item
    precipation_type = Category.where(name: @client.precipation_type)
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
    params.require(:coordinate).permit(:address, :latitude, :longitude, :date)
  end

end