require 'rails_helper'

describe User do
  describe "validation" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :username }
  end

  describe "association" do
    it { should have_many(:trips) }
    it { should have_many(:itineraries) }
    it { should have_many(:itineraries).through(:trips) }
    it { should have_many(:destinations) }
    it { should have_many(:destinations).through(:trips) }
    it { should have_many(:destinations).through(:trips).as(:locations) }
  end
end