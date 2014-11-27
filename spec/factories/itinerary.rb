require 'date'

FactoryGirl.define do
  factory :itinerary do
    start_date Date.new(2014,11,25)
    end_date Date.new(2014,11,30)

    factory :invalid_itinerary do
      start_date nil
    end
  end
end