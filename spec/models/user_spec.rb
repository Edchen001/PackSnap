require 'rails_helper'

describe User do
  describe "validations" do
    subject { build(:user) }
    it { should have_secure_password }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :username }
  end
  describe "associations" do
    it { should have_many :comments }
    it { should have_many :items }
    it { should have_many :destinations }
  end
end
