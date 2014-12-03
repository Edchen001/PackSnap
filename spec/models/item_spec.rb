require 'rails_helper'

describe Item do
    describe "validations" do
    it { should validate_presence_of :name }
    it { should have_attached_file(:image) }
    it { should validate_attachment_size(:thumb) }
    it { should validate_attachment_size(:medium) }

  end
  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :location }
    it { should have_many :comments}
    it { should have_many :suggestions }
    it { should have_many :categories }
  end
end

