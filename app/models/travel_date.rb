class TravelDate < ActiveRecord::Base
  validates :current_date, :destination, :weather_id, presence:true

  belongs_to :destination
  has_one :weather
end
