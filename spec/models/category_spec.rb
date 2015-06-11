require 'rails_helper'
require 'spec_helper'

RSpec.describe Category, type: :model do
  
  it "has a valid factory" do 
    expect(FactoryGirl.create(:category)).to be_valid
  end

  it "has a name" do 
    expect(FactoryGirl.build(:category, name: "   ")).not_to be_valid
  end

  it "has a unique name" do
    cat = FactoryGirl.create(:category)
    expect(FactoryGirl.build(:category, name: cat.name)).not_to be_valid
  end

  it "can be associated with an item" do
    i = FactoryGirl.create(:item)
    cat = FactoryGirl.create(:category)
    cat.items << i
    p cat.items
    expect(cat).to be_valid
  end
end
