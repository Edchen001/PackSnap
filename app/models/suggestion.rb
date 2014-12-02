class Suggestion < ActiveRecord::Base
	validates :category_id, :item_id, presence: true

	belongs_to :category
	belongs_to :item
end