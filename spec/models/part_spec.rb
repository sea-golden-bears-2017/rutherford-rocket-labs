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
    let!(:part) { Part.create(name: "Test Part") }
    let!(:order1) { Order.create() }
    let!(:order2) { Order.create() }
    it "has many orders" do
      OrdersPart.create(order: order1, part: part, quantity_ordered: 3)
      OrdersPart.create(order: order2, part: part, quantity_ordered: 8)
      expect(part.orders.length).to eq 2
    end
  end
end
