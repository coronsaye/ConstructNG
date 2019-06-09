require 'rails_helper'

RSpec.describe "Api::V1::ProductImages", type: :request do
  describe "GET /api/v1/product_images" do
    it "works! (now write some real specs)" do
      get api_v1_product_images_path
      expect(response).to have_http_status(200)
    end
  end
end
