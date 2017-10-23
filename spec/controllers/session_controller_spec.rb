require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user1) do
    user1 = User.new(first_name: "Anna", last_name: "J", username: "annaj")
    user1.password = 'password'
    user1.save
    user1
  end
  describe "sessions#new" do
    it "returns a status of 302" do
      session[:user_id] = user1.id
      get :new
      expect(response.status).to eq 302
    end
  end
  describe "session#create" do
    it "redirects to orders index page if the session created successfully" do
      get :create, params: {username: "annaj", password: 'password'}
      expect(response.status).to eq 302
    end
    it "shows errors if the details given are Invalid" do
      get :create, params: {username: "Ashlarngoirwngoin", password: 'password'}
      expect(assigns[:errors]).to eq(["Invalid combination of username/password."])
    end
    it "shows errors if the details given are Invalid" do
      get :create, params: {username: "annaj", password: 'passwordwrong'}
      expect(assigns[:errors]).to eq(["Invalid combination of username/password."])
    end
  end
  describe "sessions#destroy" do
    it "redirects to the new session" do
      session[:user_id] = user1.id
      delete :destroy, params:{id: user1.id}
      expect(response.status).to eq 302
    end

  end
end
