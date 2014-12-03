require 'rails_helper'

describe Item do
    describe "validations" do
    it { should validate_presence_of :name }
  end
  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :location }
    it { should have_many :comments}
    it { should have_many :suggestions }
    it { should have_many :categories }
  end
end

