class Location < ActiveRecord::Base
  validates_presence_of :address

  has_many :items
  has_many :visitors, through: :items, source: :user
end
