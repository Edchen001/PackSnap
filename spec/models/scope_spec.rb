require 'rails_helper'

describe Scope do
  describe "validations" do
    it { should validate_presence_of :minimum }
    it { should validate_presence_of :maximum }
  end
  describe "associations" do
    it { should belong_to :category }
  end
end
