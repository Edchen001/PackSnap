class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :username, :email, :password
  validates_uniqueness_of :email

  has_many :items
  has_many :destinations, through: :items, source: :location
end