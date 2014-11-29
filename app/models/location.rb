class Location < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :coordinate
end	
