require 'rails_helper'
require 'spec_helper'

RSpec.describe Item, type: :model do
  
  it "has a valid factory" do 
    expect(FactoryGirl.build(:item)).to be_valid
  end

  it "has a valid title"
  it "has a valid description"
end
