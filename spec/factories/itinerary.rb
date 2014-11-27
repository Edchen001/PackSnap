require 'date'

FactoryGirl.define do
  factory :itinerary do
    start_date Date.new(2014,11,25)
    end_date Date.new(2014,11,30)
    association :trip, factory: :trip

    factory :invalid_itinerary do
      start_date nil
    end
  end
end