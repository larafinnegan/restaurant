FactoryGirl.define do
  factory :order_detail do
    association :item
    association :order
  end
end
