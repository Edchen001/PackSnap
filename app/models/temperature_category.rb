class TemperatureCategory < AcitveRecord::Base
	validates :type, :range, presence: true
	has_many :suggestions
	has_many :items, through: :suggestions 
end