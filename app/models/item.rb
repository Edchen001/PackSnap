class Item < ActiveRecord::Base
	# validates :name, :url, presence: true
	has_many :suggestions
	has_many :categories, through: :suggestions 


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/public/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end