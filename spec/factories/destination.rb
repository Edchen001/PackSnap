require 'date'

FactoryGirl.define do
  factory :destination do
    location "Canton"
    start_date Date.new(2014,11,25)
    end_date Date.new(2014,11,30)

    factory :invalid_destination do
      location nil
    end
  end
end