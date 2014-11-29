class TemperatureRange < AcitveRecord::Base
	validates :minimum, :maximum, presence: true
	belongs_to :temperature_catergory
end