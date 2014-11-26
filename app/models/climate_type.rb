class ClimateType < ActiveRecord::Base
  validates :code, :type, :description, presence:true
end
