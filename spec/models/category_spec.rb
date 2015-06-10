require 'rails_helper'
require 'spec_helper'

RSpec.describe Category, type: :model do
  
  it "has a valid factory" do 
    expect(FactoryGirl.build(:category)).to be_valid
  end

  it "has a name" do 
    expect(FactoryGirl.build(:category, name: "   ")).not_to be_valid
  end
end
