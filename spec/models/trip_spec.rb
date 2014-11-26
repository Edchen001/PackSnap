require 'rails_helper'

describe Trip do
  describe "validations" do
    it { should validate_presenece_of :title }
  end

  describe "associations" do
    it { should have_many :destinations }
  end
end
