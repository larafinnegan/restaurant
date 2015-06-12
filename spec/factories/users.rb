FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    display_name { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { |user| user.password }
  end
end
