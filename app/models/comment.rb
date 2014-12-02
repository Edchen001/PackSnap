class Comment < ActiveRecord::Base

validates :content, :user_id, :location_id, presence: true
belongs_to :user
belongs_to :location
end