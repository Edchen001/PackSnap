class Location < ActiveRecord::Base
  validates_presence_of :address

  has_many :items

  has_many :comments
  has_many :visitors, through: :comments, source: :user
end
