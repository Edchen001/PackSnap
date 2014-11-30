class Item < ActiveRecord::Base
	# validates :name, :url, presence: true
	has_many :suggestions
	has_many :categories, through: :suggestions 

  has_attached_file 	:photo, styles: { :medium => "300x300!", :thumb => "100x100>" }

do_not_validate_attachment_file_type :photo
  # validates_attachment_content_type :photo, :content_type => "jpg"
end