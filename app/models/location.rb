class Location < ActiveRecord::Base
  validates_presence_of :address
  belongs_to :itinerary
  belongs_to :coordinate

  has_many :photos
  has_many :users, through: :photos
end
