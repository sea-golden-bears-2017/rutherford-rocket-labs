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

end
