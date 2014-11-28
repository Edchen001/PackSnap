class ClimateType < ActiveRecord::Base
  validates :code, :name, :description, presence:true
end
