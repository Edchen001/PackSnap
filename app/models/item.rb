class Item < ActiveRecord::Base
	validates :name, :suggestable_id, presence: true

  belongs_to :user
  belongs_to :suggestable, polymorphic: true

  has_attached_file :image, styles: { :medium => "300x300!", :thumb => "100x100>" }, whiny: false
  do_not_validate_attachment_file_type :image
end