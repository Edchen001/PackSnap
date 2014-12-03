require 'rails_helper'

describe Comment do
    describe "validations" do
    it { should validate_presence_of :content }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :location_id }
  end
  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :location }
    it { should belong_to :item }
  end
end

