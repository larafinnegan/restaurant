require 'faker'

FactoryGirl.define do 
  factory :item do
    title { Faker::Lorem.sentence}
    description { Faker::Lorem.paragraph}
    price { Faker::Commerce.price }
  end
end