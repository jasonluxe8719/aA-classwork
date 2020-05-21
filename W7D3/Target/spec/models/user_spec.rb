require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }

  describe "password=" do
    it "should accept a password string as an argument" do
      carlos = FactoryBot.build(:user)
      expect(carlos.password = "password").to_not raise_error
    end

    it "should set the password" do
      carlos = FactoryBot.build(:user)
      expect(BCrypt::Password).to receive(:create).with('password')
      carlos.password = "password"
      expect(carlos.password).to eq("password")
    end
  end

  



end
