class Trip < ActiveRecord::Base
  validates_presence_of :title

  has_many :destinations
end
