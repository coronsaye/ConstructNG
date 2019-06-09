require 'rails_helper'

RSpec.describe "Api::V1::UserAddresses", type: :request do
  describe "GET /api/v1/user_addresses" do
    it "works! (now write some real specs)" do
      get api_v1_user_addresses_path
      expect(response).to have_http_status(200)
    end
  end
end
