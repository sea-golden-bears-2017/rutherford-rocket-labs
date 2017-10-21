require 'rails_helper'

RSpec.describe PartsController, type: :controller do
  describe "parts#index" do
    before(:each) { get :index }
    it "returns a 200 status" do
      expect(response.status).to eq 200
    end

    it "assigns all parts" do
      expect(assigns[:parts]).to eq Part.all
    end
  end

  describe "parts#show" do
    let!(:part1) { Part.create(name: "Test Part") }
    before(:each) { get :show, params: {id: part1.id} }
      it "returns a status 200" do
        expect(response.status).to eq 200
      end
  end
  describe "parts#new" do
    before(:each) { get :new }
      it "returns a status 200" do
        expect(response.status).to eq 200
      end
  end
  describe "parts#create" do
    before(:each) { get :create, params:{ part:{name: "greatidium", min: 2, max: 10} }}
    it "returns a status 302" do
      expect(response.status).to eq 302
    end
    it "returns the new page if errors found in saving" do
      get :create, params:{ part:{name: "greatidium", min: nil, max: 10} }
      expect(response).to render_template :new
    end
  end
  describe "part#update" do
    let!(:warehouse) { Warehouse.create( location: "Seattle")}
    let!(:part1) { Part.create(name: "Test Part") }
    let!(:parthouse) {PartsWarehouse.create(warehouse: warehouse, part: part1, quantity:24)}
    before(:each) { get :update, params: {id: part1.id, location_part:{warehouse.id => 2}}}
    it "returns a 200 status" do
      expect(response.status).to eq 200
    end
  end

end
