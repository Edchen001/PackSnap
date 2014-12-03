class DashController < ApplicationController

  def index
    @user = User.new

    @location = Location.find_or_create_by(location_params)

    weather_info = Forecast.new(params[:forecast])
    @weather = weather_info.current_weather
    puts @weather
    scope = Scope.get_weather_scope(@weather)
    @suggested_items = Category.unique_items(scope, weather_info.precipation_type)
    @summary = weather_info.summary

    render :dashboard, layout: false
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(location_id: location_params[:id])
    @comment = Comment.new(user_id: session[:user_id], location_id: location_params[:id], item: @item)

    @comment.assign_attributes(comment_params)
    @item.assign_attributes(item_params)

    if !@item.save!
      flash[:error] = @item.errors.full_messages
    elsif !@comment.save!
      flash[:error] = @comment.errors.full_messages
    else
      flash[:success] = "success!"
    end

    redirect_to user_path(session[:user_id])

  end


  private

  def location_params
    params.require(:location).permit(:address, :latitude, :longitude, :id)
  end

  def item_params
    params.require(:item).permit(:name, :image, :user_id)
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
