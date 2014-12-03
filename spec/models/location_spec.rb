require 'rails_helper'

describe Location do
  describe "validations" do
    it { should validate_presence_of :address }
  end
end