class Trip < ActiveRecord::Base
  validates_presence_of :title

  has_many :itineraries
  belongs_to :user

  has_attached_file :bag, :styles => { medium: "300x300"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
