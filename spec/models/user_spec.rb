require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(first_name: "test", last_name: "name", admin: true, username: "testuser", password: 'password')}
  describe "attributes" do
    it "has a first_name" do
      expect(user.first_name).to eq "test"
    end

    it "has a last_name" do
      expect(user.last_name).to eq "name"
    end

    it "has an username" do
      expect(user.username).to eq "testuser"
    end
  end

  describe "validations" do

    let(:user) { User.new(first_name: "test", last_name: "name", admin: true, username: "testuser", password: 'password')}

    it "is valid with a first_name" do
      expect( user.valid? ).to eq true
    end

    it "is invalid without a first_name" do
      user.first_name = nil
      expect( user.valid? ).to eq false
    end

    it "is valid with a last_name" do
      expect( user.valid? ).to eq true
    end

    it "is invalid without a last_name" do
      user.last_name = nil
      expect( user.valid? ).to eq false
    end

    it "is valid with a username" do
      expect( user.valid? ).to eq true
    end

    it "is invalid without a username" do
      user.username = nil
      expect( user.valid? ).to eq false
    end

    it "is valid with a password" do
      expect( user.valid? ).to eq true
    end

    it "is invalid without a password" do
      user.password = nil
      expect( user.valid? ).to eq false
    end
  end

  describe "associations" do
    it { should have_many(:processed_orders).class_name('Order') }
    it { should have_many(:created_orders).class_name('Order') }
  end
end
