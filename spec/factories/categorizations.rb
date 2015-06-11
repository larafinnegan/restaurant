FactoryGirl.define do
  factory :categorization do
    association :item
    association :category
  end
end
