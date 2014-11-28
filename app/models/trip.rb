class Trip < ActiveRecord::Base
  validates_presence_of :title

  has_many :itineraries
  belongs_to :user
end
