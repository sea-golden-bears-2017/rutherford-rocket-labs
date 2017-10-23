require 'rails_helper'

RSpec.describe OrdersPartsController, type: :controller do
  let!(:warehouse) { Warehouse.create(location: "Seattle") }
  let!(:user1) do
    user1 = User.new(first_name: "Anna", last_name: "J", username: "annaj")
    user1.password = 'password'
    user1.save
    user1
  end
  let!(:order1) { Order.create(warehouse: warehouse, creator: user1, processor: user1) }
  let!(:part1) { Part.create(name: "Test Part") }
  let!(:orderspart) { OrdersPart.create(order: order1, part: part1, quantity_ordered: 2) }
  describe "orderspart#new" do
    it "returns a status 200" do
      get :new, params: {order_id: order1.id}
      expect(response.status).to eq 200
    end
    it "initializes a new order" do
      get :new, params: {order_id: order1.id}
      expect(assigns[:order]).to eq(order1)
    end
  end
  describe "orderspart#create" do
    it "renders a status of 302" do
      get :create, params: {order_id: order1.id, orders_part: {part_id: part1.id, quantity: 2}}
      expect(response.status).to eq 302
    end
    it "creates a new entry in orders_part" do
      get :create, params: {order_id: order1.id, orders_part: {part_id: part1.id, quantity: 2}}
      expect(assigns[:orders_part]).to be_a(OrdersPart)
    end
  end
end
