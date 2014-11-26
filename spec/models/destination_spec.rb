require "rails_helper"

describe Destination do
  describe "Associations for desitination model" do
   it {should have_many(:travel_dates)}
   it {should have_many(:weathers)}
   it { should belong_to(:trip) }
  end

  describe "Have validations" do
    it {should validate_presence_of :location}
    it {should validate_presence_of :start_date}
    it {should validate_presence_of :end_date}
  end

end
