class Location < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :itinerary
  belongs_to :coordinate
end
