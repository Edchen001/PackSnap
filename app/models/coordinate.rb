	class Coordinate < ActiveRecord::Base
  belongs_to :climate_type
  has_many :locations
  validates :longitude, :latitude, presence:true
end
