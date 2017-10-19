require 'rails_helper'

RSpec.describe OrdersPart, type: :model do
  describe "attributes" do
    let!(:part) { Part.create(name: "Test Part") }
    let!(:order) { Order.create() }
    let!(:orderspart) { OrdersPart.create(order: order, part: part, quantity_ordered: 3) }

    it "has a quantity ordered" do
      expect(orderspart.quantity_ordered).to eq 3
    end

    it "has a quantity_received that is nil on creation" do
      expect(orderspart.quantity_received).to eq nil
    end

    it "has a quantity_received that can be filled in later" do
      orderspart.quantity_received = 2
      expect(orderspart.quantity_received).to eq 2
    end
  end

  describe "associations" do
    let!(:part) { Part.create(name: "Test Part") }
    let!(:order) { Order.create() }
    let!(:orderspart) { OrdersPart.create(order: order, part: part, quantity_ordered: 3) }
    it "belongs to a part" do
      expect(orderspart.part).to eq(part)
    end

    it "belongs to an order" do
      expect(orderspart.order).to eq(order)
    end
  end
end
