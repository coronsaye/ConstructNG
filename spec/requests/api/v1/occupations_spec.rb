require 'rails_helper'

RSpec.describe "Api::V1::Occupations", type: :request do
  describe "GET /api/v1/occupations" do
    it "works! (now write some real specs)" do
      get api_v1_occupations_path
      expect(response).to have_http_status(200)
    end
  end
end
