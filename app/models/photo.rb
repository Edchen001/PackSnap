class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :items

  has_attached_file :image, styles: { :medium => "300x300!", :thumb => "100x100>" }, whiny: false
  do_not_validate_attachment_file_type :image
end