require 'rails_helper'

RSpec.describe "Api::V1::TaxClasses", type: :request do
  describe "GET /api/v1/tax_classes" do
    it "works! (now write some real specs)" do
      get api_v1_tax_classes_path
      expect(response).to have_http_status(200)
    end
  end
end
