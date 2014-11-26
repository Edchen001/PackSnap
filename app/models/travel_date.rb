class TravelDate < ActiveRecord::Base
  validates :current_date, :itinerary, :weather_id, presence:true

  belongs_to :itinerary
  has_one :weather
end
