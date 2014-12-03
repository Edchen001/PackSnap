require 'rails_helper'

describe Suggestion do
describe "validations" do
    it { should validate_presence_of :category_id }
    it { should validate_presence_of :item_id }
  end
  describe "associations" do
    it { should belong_to :category }
    it { should belong_to :item }
  end
end

