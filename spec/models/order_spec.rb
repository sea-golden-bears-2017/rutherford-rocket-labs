require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "attributes" do
    let!(:order) { Order.create() }
    it "has a value of false for submitted on creation" do
      expect(order.submitted).to eq false
    end

    it "has a value of false for processed on creation" do
      expect(order.processed).to eq false
    end

    it "can be marked as processed" do
      order.submitted = true
      expect(order.submitted).to eq true
    end

    it "has a minumum quantity that can be set" do
      order.processed = true
      expect(order.processed).to eq true
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
    let!(:order1) { Order.create(warehouse: warehouse, creator: user1, processor: user2) }
    let!(:part1) { Part.create(name: "Test Part") }
    let!(:part2) { Part.create(name: "Test Part 2") }
    let!(:warehouse) { Warehouse.create(name: "Ash", location: "Seattle") }
    it "has many parts" do
      OrdersPart.create(order: order1, part: part1, quantity_ordered: 3)
      OrdersPart.create(order: order1, part: part2, quantity_ordered: 8)
      expect(order1.parts.length).to eq 2
    end

    it { should belong_to(:creator).class_name('User') }
    it { should belong_to(:processor).class_name('User') }

    it "belongs to a warehouse" do
      order1.warehouse = warehouse
      expect(order1.warehouse).to eq(warehouse)
    end
  end
end
