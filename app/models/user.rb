class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :username, :email
  validates_presence_of :password, on: :create
  validates_uniqueness_of :email

  has_many :comments
  has_many :items, through: :comments
  has_many :destinations, through: :comments, source: :location
end
