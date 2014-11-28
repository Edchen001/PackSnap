class ClimateType < ActiveRecord::Base
  has_many :coordinates
  validates :code, :name, :description, presence:true
end
