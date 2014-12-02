class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :username, :email, :password
  validates_uniqueness_of :email

  has_many :items

  has_many :comments
  has_many :destinations, through: :comments, source: :location
end