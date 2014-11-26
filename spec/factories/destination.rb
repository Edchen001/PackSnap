FactoryGirl.define do
  factory :destination do
    location "Canton"
    start_date Date.new(2014,11,25)
    end_date Date.new(2014,11,30)
  end
  factory :invalid_destination do
    location nil
    start_date Date.new(2014,11,25)
    end_date Date.new(2014,11,30)
  end
end