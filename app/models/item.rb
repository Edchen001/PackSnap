class Item < ActiveRecord::Base
	validates :name, presence: true

  belongs_to :user
  belongs_to :location
  has_many :comments
  has_many :suggestions
  has_many :categories, through: :suggestions

  has_attached_file :image,
  styles: { :medium => "300x300!", :thumb => "100x100>" },
  whiny: false,
  storage: :s3,
  bucket: ENV['S3_BUCKET_NAME']
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end