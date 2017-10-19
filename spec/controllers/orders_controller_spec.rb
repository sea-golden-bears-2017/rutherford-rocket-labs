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
end
