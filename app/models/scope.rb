class Scope < ActiveRecord::Base
	validates :minimum, :maximum, presence: true
	belongs_to :category
end