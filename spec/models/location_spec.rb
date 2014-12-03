require 'rails_helper'

describe Location do
  describe "validations" do
    it { should validate_presence_of :address }
  end

  describe "associations" do
    it { should have_many :items }
    it { should have_many :comments }
    it { should have_many :visitors }
  end
end
