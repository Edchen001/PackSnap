require 'rails_helper'

describe Location do
  describe "validations" do
    it { should validate_presence_of :address }
  end
  describe "associations" do
    it { should belong_to :itinerary }
  end
end