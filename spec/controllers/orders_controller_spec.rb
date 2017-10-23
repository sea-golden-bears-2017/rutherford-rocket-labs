require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "orders#index" do
    before(:each) { get :index }
    it "returns a 200 status" do
      expect(response.status).to eq 200
    end

    it "assigns all orders" do
      expect(assigns[:orders]).to eq Order.all
    end
  end

  describe "orders#new" do
    before(:each) { get :new }
    it "returns a 200 status" do
      expect(response.status).to eq 200
    end
  end
  describe "orders#show" do
    let!(:user1) do
      user1 = User.new(first_name: "Anna", last_name: "J", username: "annaj")
      user1.password = 'password'
      user1.save
      user1
    end
    let!(:user2) do
      user2 = User.new(first_name: "Ash", last_name: "J", username: "ashj")
      user2.password = 'password'
      user2.save
      user2
    end
    let!(:warehouse) { Warehouse.create(location: "Seattle") }
    let!(:order1) { Order.create(warehouse: warehouse, creator: user1, processor: user2) }
    before(:each) { get :show, params: {id: order1.id} }
    it "returns a 200 status" do
      expect(response.status).to eq 200
    end
  end
  describe "orders#create" do
    let!(:user1) do
      user1 = User.new(first_name: "Anna", last_name: "J", username: "annaj")
      user1.password = 'password'
      user1.save
      user1
    end
    let!(:user2) do
      user2 = User.new(first_name: "Ash", last_name: "J", username: "ashj")
      user2.password = 'password'
      user2.save
      user2
    end
    let!(:warehouse) { Warehouse.create(location: "Seattle") }
    let!(:order1) { Order.create(warehouse: warehouse, creator: user1, processor: user2) }

    it "after creating a new entry returns a status 302" do
      session[:user_id] = user1.id
      get :create, params: {order: {warehouse: "#{warehouse.id}"}}
      expect(response.status).to eq 302
    end
  end
  describe "orders#update" do
    let!(:user1) do
      user1 = User.new(first_name: "Anna", last_name: "J", username: "annaj")
      user1.password = 'password'
      user1.save
      user1
    end
    let!(:user2) do
      user2 = User.new(first_name: "Ash", last_name: "J", username: "ashj")
      user2.password = 'password'
      user2.save
      user2
    end
    let!(:warehouse) { Warehouse.create(location: "Seattle") }
    let!(:order1) { Order.create(warehouse: warehouse, creator: user1, processor: user2) }
    let!(:part1) { Part.create(name: "Test Part") }
    let!(:orderspart) { OrdersPart.create(order: order1, part: part1, quantity_ordered: 2) }
    it "updates the submitted order " do
      session[:user_id] = user1.id
      get :update, params: {id: order1.id, order: {submitted: true}}
      expect((assigns[:order]).submitted).to eq true
    end
    it "updates an order which is being processed" do
      session[:user_id] = user1.id
      get :update, params: {id: order1.id, part_id: {orderspart.id => 2}}
      expect((assigns[:order]).processed).to eq true
    end
  end




end
