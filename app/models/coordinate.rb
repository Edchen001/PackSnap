class Coordinate < ActiveRecord::Base
  belongs_to :climate_type

  validates :longitude, :latitude, presence:true
end
