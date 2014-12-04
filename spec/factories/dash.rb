FactoryGirl.define do
  factory :item do
    name "test"

    factory :comment do
      content "test"
      user_id 1
      location_id 1
    end
  end
end
