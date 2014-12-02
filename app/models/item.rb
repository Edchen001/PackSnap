class Item < ActiveRecord::Base
	validates :name, presence: true

  belongs_to :user
  belongs_to :location
  has_many :comments
  has_many :suggestions
  has_many :categories, through: :suggestions

  has_attached_file :image, styles: { :medium => "300x300!", :thumb => "100x100>" }, whiny: false
  do_not_validate_attachment_file_type :image
end