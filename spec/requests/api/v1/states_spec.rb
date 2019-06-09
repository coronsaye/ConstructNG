require 'rails_helper'

RSpec.describe "Api::V1::States", type: :request do
  describe "GET /api/v1/states" do
    it "works! (now write some real specs)" do
      get api_v1_states_path
      expect(response).to have_http_status(200)
    end
  end
end
