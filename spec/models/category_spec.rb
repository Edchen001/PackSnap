require 'rails_helper'

describe Category do
    describe "validations" do
    it { should validate_presence_of :name }
  end
  describe "associations" do
    it { should have_many :suggestions }
    it { should have_many :items }
    it { should have_one :scope }
  end
end
