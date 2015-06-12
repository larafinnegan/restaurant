require 'rails_helper'
require 'spec_helper'

RSpec.describe Item, type: :model do
  
  it "has a valid factory" do 
    expect(FactoryGirl.create(:item)).to be_valid
  end

  it "has a title that isn't blank" do 
    expect(FactoryGirl.build(:item, title: "   ")).not_to be_valid
  end

   it "has a description that isn't blank" do 
    expect(FactoryGirl.build(:item, description: "   ")).not_to be_valid
  end

     it "has a price" do 
    expect(FactoryGirl.build(:item, price: nil)).not_to be_valid
  end

   it "cannot have a price of 0" do 
    expect(FactoryGirl.build(:item, price: 0.00)).not_to be_valid
  end

  it "cannot have a price less than 0.01" do 
    expect(FactoryGirl.build(:item, price: 0.001)).not_to be_valid
  end

   it "has a unique title" do
      FactoryGirl.create(:item, title: "New Title")
      expect(FactoryGirl.build(:item, title: "New Title")).not_to be_valid
  end

  it "price cannot be larger than 999.99" do
      expect(FactoryGirl.build(:item, price: 1000)).not_to be_valid
  end

   it "cannot have a price with more than 2 decimal places" do
      expect(FactoryGirl.build(:item, price: 2.345)).not_to be_valid
  end

  it "has at least one category" do
    expect(FactoryGirl.build(:item, categories: [])).not_to be_valid
  end

   it "is not retired by default" do
    new_item = FactoryGirl.create(:item)
    expect(new_item.retired).to be false
  end

   it "cannot have a blank retired field" do
      expect(FactoryGirl.build(:item, retired: nil)).not_to be_valid
  end

end
