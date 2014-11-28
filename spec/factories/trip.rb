FactoryGirl.define do
  factory :trip do
    title "Yaay!"
    description "Yaaaaaaay!"
    user_id 1

    factory :invalid_trip do
      title nil
    end
  end
end