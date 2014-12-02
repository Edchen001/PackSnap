class Location < ActiveRecord::Base
  validates_presence_of :address

  has_many :items, as: :suggestable
end
