FactoryGirl.define do
  factory :order do
    user { FactoryGirl.create(:user) }
  end

end
