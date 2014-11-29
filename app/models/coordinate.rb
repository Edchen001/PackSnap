class Coordinate < ActiveRecord::Base
  has_many :locations
  validates :longitude, :latitude, presence:true
end
