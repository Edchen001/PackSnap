class Item < AcitveRecord::Base
	validates :name, :url, presence: true
	has_many :suggestions
	has_many :temperature_categories, through: :suggestions 
end