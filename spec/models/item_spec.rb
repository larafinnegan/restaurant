require 'rails_helper'
require 'spec_helper'

RSpec.describe Item, type: :model do
  
  it "has a valid factory" do 
    expect(FactoryGirl.build(:item)).to be_valid
  end

  it "cannot have an empty title" do 
    expect(FactoryGirl.build(:item, title: "   ")).not_to be_valid
  end

   it "cannot have an empty description" do 
    expect(FactoryGirl.build(:item, description: "   ")).not_to be_valid
  end

   it "cannot have a price of 0" do 
    expect(FactoryGirl.build(:item, price: 0.00)).not_to be_valid
  end

  it "cannot have a price less than 0" do 
    expect(FactoryGirl.build(:item, price: -1.00)).not_to be_valid
  end

   it "has a unique title" do
      new_item = FactoryGirl.create(:item)
      expect(FactoryGirl.build(:item, title: new_item.title)).not_to be_valid
  end

  it "price must have 2 decimal places" do
      item = FactoryGirl.create(:item)
      p item.price
      expect(FactoryGirl.build(:item, price: 5.002)).to eql(5.00)
  end
end
