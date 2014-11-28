require 'rails_helper'

describe Trip do
  describe "validations" do
    it { should validate_presence_of :title }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many :itineraries }
  end
end
