require 'rails_helper'

RSpec.describe "Api::V1::TaxRates", type: :request do
  describe "GET /api/v1/tax_rates" do
    it "works! (now write some real specs)" do
      get api_v1_tax_rates_path
      expect(response).to have_http_status(200)
    end
  end
end
