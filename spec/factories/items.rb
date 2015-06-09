require 'faker'

FactoryGirl.define do 
  factory :item do
    title { Faker::Lorem.words(4) }
    description { Faker::Lorem.paragraph}
    price { Faker::Commerce.price }
  end
end