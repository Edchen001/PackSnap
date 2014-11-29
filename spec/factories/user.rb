FactoryGirl.define do
  factory :user do
    username "test"
    sequence(:email) { |n| "test#{n}@dbc.com"}
    password "test"
    password_confirmation "test"

    factory :invalid_user do
      email nil
    end
  end
end