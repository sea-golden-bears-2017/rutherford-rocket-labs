require 'rails_helper'

RSpec.describe WarehousesController do
  describe "warehouse#index" do
    before(:each) { get :index }
    it "returns a 200 status" do
      expect(response.status).to eq 200
    end

    it "assigns all warehouses" do
      expect(assigns[:warehouses]).to eq Warehouse.all
    end
  end
  describe "warehouse#show" do
    let!(:warehouse) { Warehouse.create( location: "Seattle")}
    before(:each) { get :show, params: {id: warehouse.id} }
    it "returns a 200 status" do
      expect(response.status).to eq 200
    end
    it "displays the show page" do
      expect(response).to render_template(:show)
    end
  end
  describe "warehouse#update" do
    let!(:warehouse) { Warehouse.create( location: "Seattle")}
    let!(:part1) { Part.create(name: "Test Part") }
    let!(:parthouse) {PartsWarehouse.create(warehouse: warehouse, part: part1, quantity:24)}
    before(:each) { get :update, params: {id: part1.id, location_part:{warehouse.id => 2}}}
    it "returns a 302 status" do
      expect(response.status).to eq 302
    end
    it "shows errors if the quantity requested is greater" do
       get :update, params: {id: part1.id, location_part:{warehouse.id => 50}}
      expect(response).to render_template(:show)
    end
  end
end
