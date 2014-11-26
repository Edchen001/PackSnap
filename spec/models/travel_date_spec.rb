require "rails_helper"

describe TravelDate do
  describe "Associations for TravelDate model" do
   it {should belong_to :itinerary}
   it {should have_one :weather}
  end

  describe "Validations" do
  it {should validate_presence_of :current_date}
  it {should validate_presence_of :itinerary}
  it {should validate_presence_of :weather_id}
  end

end
