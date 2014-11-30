class Item < ActiveRecord::Base
	# validates :name, :url, presence: true
	has_many :suggestions
	has_many :categories, through: :suggestions 
end