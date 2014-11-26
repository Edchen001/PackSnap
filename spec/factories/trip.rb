FactoryGirl.define do
  factory :trip do
    title "Yaay!"
    description "Yaaaaaaay!"

    factory :invalid_trip do
      title nil
      description "Yaaaaaaay!"
    end
  end
end