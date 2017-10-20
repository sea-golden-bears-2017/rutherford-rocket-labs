require 'rails_helper'

RSpec.describe Part, type: :model do
  describe "attributes" do
    let!(:part) { Part.create(name: "Test Part") }
    it "has a name" do
      expect(part.name).to eq "Test Part"
    end

    it "is initialized without a minimum quantity" do
      expect(part.min).to eq nil
    end

    it "is initialized without a maximum quantity" do
      expect(part.max).to eq nil
    end

    it "has a minumum quantity that can be set" do
      part.min = 2
      expect(part.min).to eq 2
    end

    it "has a maxiumum quantity that can be set" do
      part.max = 10
      expect(part.max).to eq 10
    end
  end

  describe "associations" do
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
    let!(:part) { Part.create(name: "Test Part") }
    let!(:warehouse) {Warehouse.create(name: "Storage B", location: "Houston")}
    let!(:order1) { Order.create(warehouse: warehouse, creator: user1, processor: user2) }
    let!(:order2) { Order.create(warehouse: warehouse, creator: user2, processor: user1) }

    it "has many orders" do
      OrdersPart.create(order: order1, part: part, quantity_ordered: 3)
      OrdersPart.create(order: order2, part: part, quantity_ordered: 8)
      expect(part.orders.length).to eq 2
    end
  end
end
