class Category < ActiveRecord::Base
	validates :name, presence: true

	has_many :suggestions
	has_many :items, through: :suggestions
	has_one :scope
end