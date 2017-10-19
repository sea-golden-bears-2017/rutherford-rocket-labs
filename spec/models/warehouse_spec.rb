require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe "attributes" do
    let!(:warehouse) { Warehouse.create(name: "Ash", location: "Seattle") }
    it "has a location" do
      expect(warehouse.location).to eq("Seattle")
    end

    it "has a name" do
      expect(warehouse.name).to eq("Ash")
    end

  end

  describe "associations" do
    let!(:part1) { Part.create(name: "Test Part") }
    let!(:part2) { Part.create(name: "Test Part 2") }
    let!(:warehouse) { Warehouse.create(name: "Ash", location: "Seattle") }
    it "has many parts" do
      PartsWarehouse.create(part: part1, warehouse: warehouse, quantity: 15)
      PartsWarehouse.create(warehouse: warehouse, part: part2, quantity: 8)
      expect(warehouse.parts.length).to eq 2
    end
  end
end
