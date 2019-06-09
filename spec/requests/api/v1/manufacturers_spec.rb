require 'rails_helper'

RSpec.describe "Api::V1::Manufacturers", type: :request do
  describe "GET /api/v1/manufacturers" do
    it "works! (now write some real specs)" do
      get api_v1_manufacturers_path
      expect(response).to have_http_status(200)
    end
  end
end
