class Date < ActiveRecord::Base
  validates :current_date, :destination, :weather, presence:true
  belongs_to :destination
  belongs_to :weather
end
