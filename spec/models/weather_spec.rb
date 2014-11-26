require 'rails_helper'

describe Weather do
  describe "associations for weather" do
    it { should belong_to(:travel_date) }
    it "should also save celsius if given fahrenheit" do
      weather = create(:weather)
      expect(weather.celsius).to_not be_nil
    end
    it "should save fahrenheit" do
      weather = create(:weather, celsius: 40, fahrenheit: nil)
      expect(weather.fahrenheit).to_not be_nil
    end
  end
end
