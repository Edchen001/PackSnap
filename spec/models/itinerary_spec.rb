require "rails_helper"

describe Itinerary do
  describe "Associations for itinerary model" do
   it {should have_many(:travel_dates)}
   it {should have_many(:weathers)}
   it { should belong_to(:trip) }
   it { should have_many(:destinations) }
   it { should have_many(:destinations).class_name("Location") }
  end

  describe "Have validations" do
    it {should validate_presence_of :start_date}
    it {should validate_presence_of :end_date}
  end

end
