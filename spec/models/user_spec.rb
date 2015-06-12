require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "has a valid factory" do 
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "has a first name" do 
    expect(FactoryGirl.build(:user, first_name: "   ")).not_to be_valid
  end

    it "has a first name shorter than 21 characters" do 
    expect(FactoryGirl.build(:user, first_name: "a" * 21)).not_to be_valid
  end

   it "has a last name" do 
    expect(FactoryGirl.build(:user, last_name: "   ")).not_to be_valid
  end

    it "has a last name shorter than 21 characters" do 
    expect(FactoryGirl.build(:user, last_name: "a" * 21)).not_to be_valid
  end

   it "can have a nil display name" do 
    expect(FactoryGirl.build(:user, display_name: nil)).to be_valid
  end

   it "cannot have an empty string as a display name" do 
    expect(FactoryGirl.build(:user, display_name: "     ")).not_to be_valid
  end

  it "cannot have a display name less than 2 characters" do 
    expect(FactoryGirl.build(:user, display_name: "a")).not_to be_valid
  end

    it "cannot have a display name more than 32 characters" do 
    expect(FactoryGirl.build(:user, display_name: "a" * 33)).not_to be_valid
  end

   it "has an email address containing an @ sign" do 
    expect(FactoryGirl.build(:user, email: "     ")).not_to be_valid
  end

  it "has an email address less than 256 characters" do 
    expect(FactoryGirl.build(:user, email: "s@" + ("a" * 254))).not_to be_valid
  end

  it "converts email addresses to downcase" do 
    person = FactoryGirl.create(:user, email: "ExAMPle@ExamPle.com")
    expect(person.email).to eql("example@example.com")
  end

  it "doesn't allow duplicate email addresses" do 
    FactoryGirl.create(:user, email: "ExAMPle@ExamPle.com")
    expect(FactoryGirl.build(:user, email: "example@example.com")).not_to be_valid
  end

   it "has a password" do 
    expect(FactoryGirl.build(:user, password: "      ", password_confirmation: "      ")).not_to be_valid
  end

   it "has a minimum password length of 6" do 
    expect(FactoryGirl.build(:user, password: "12345", password_confirmation: "12345")).not_to be_valid
  end

  it "defaults to not being an admin" do 
    person = FactoryGirl.create(:user)
    expect(person.admin).to be false
  end
end
