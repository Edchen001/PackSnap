class Suggestion < ActiveRecord::Base
	validates :item_id, :temparture_category_id, presence: true
	belongs_to :item
	belongs_to :temperature_catergory
end	