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
    let!(:part1) { Part.create(name: "Test Part") }
    let!(:part2) { Part.create(name: "Test Part 2") }
    let!(:order) { Order.create() }
    it "has many parts" do
      OrdersPart.create(order: order, part: part1, quantity_ordered: 3)
      OrdersPart.create(order: order, part: part2, quantity_ordered: 8)
      expect(order.parts.length).to eq 2
    end
  end
end
