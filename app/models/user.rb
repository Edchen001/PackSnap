class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :email, :password
  validates_uniqueness_of :email

  has_many :trips
  has_many :itineraries, through: :trips
  has_many :destinations, through: :itineraries, source: :location
end