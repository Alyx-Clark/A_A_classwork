require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    let!(:user) { create(:user) }
    
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_length_of(:password).is_at_least(6)}
  end

  describe "uniqueness" do
    before(:each) do 
      create(:user)
    end

    it{should validate_uniqueness_of(:username)}
    it{should validate_uniqueness_of(:session_token)}
  end

  describe "#check_password?" do 
    let!(:user) {create(:user) }

    context "with a valid password" do
      it "should return true" do
        expect(user.check_password?("password")).to be true
      end
    end

    context "with a invalid password" do
      it "should return false" do
        expect(user.check_password?("belaire")).to be false
      end
    end

  end

  describe "password encryption" do
    it "does not save password to the database" do
      FactoryBot.create(:will)

      user = User.find_by(username: "Will Smith")
      expect(user.password).not_to eq("password")
    end

    it "encrypts password using BCrypt" do
      expect(BCrypt::Password).to receive(:create).with("abcdef")
      FactoryBot.build(:user, password: "abcdef")
    end
  end

  describe "::find_by_credentials" do 
    before (:each) do
      create(:user)
    end

    context "when valid credentials are provided" do 
      it "should return user" do
        user = User.find_by(username: User.last.username)
        expect(User.find_by_credentials(User.last.username, "password")).to eq(user)
      end
    end

    context "when invalid credentials are provided" do
      it "should return nil" do
        user = User.find_by(username: User.last.username)
        expect(User.find_by_credentials(User.last.username, "bad_password")).to be_nil
      end
    end
  end

  describe "#reset_session_token" do
    before (:each) do 
      create(:user)
    end
    it "should return new session token" do
      user = User.last
      current_token = user.session_token
      expect(current_token).not_to eq(user.reset_session_token!)
    end
  end
end





# New Goal
# Title: 

# Details: 

# Private? 
# Completed?