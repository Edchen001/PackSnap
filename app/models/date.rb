class Date < ActiveRecord::Base
  validates :current_date, :destination, :weather, presence:true

  belongs_to :destination
  has_one :weather
end
