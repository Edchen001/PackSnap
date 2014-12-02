FactoryGirl.define do
  factory :location do
    address "New York"
    latitude 41.12
    longitude 55.24

    factory :invalid_location do
      address nil
    end
  end
end