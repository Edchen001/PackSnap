class Destination < ActiveRecord::Base
  validates :location, :start_date, :end_date, presence:true

  has_many :dates
  has_many :weathers, through: :dates
end
