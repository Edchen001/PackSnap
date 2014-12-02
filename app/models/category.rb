class Category < ActiveRecord::Base
	validates :name, presence: true

	has_many :items, as: :suggestable
	has_one :scope
end