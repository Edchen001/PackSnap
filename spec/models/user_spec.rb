require 'rails_helper'

describe User do
  describe "validation" do
    subject { build(:user) }
    it { should have_secure_password }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :username }
  end

  describe "association" do
    it { should have_many(:trips) }
    it { should have_many(:itineraries) }
    it { should have_many(:itineraries).through(:trips) }
    it { should have_many(:destinations) }
    it { should have_many(:destinations).through(:itineraries) }
    it { should have_many(:destinations).through(:itineraries).source(:location) }
  end
end