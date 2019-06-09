require 'rails_helper'

RSpec.describe "Api::V1::UserRoles", type: :request do
  describe "GET /api/v1/user_roles" do
    it "works! (now write some real specs)" do
      get api_v1_user_roles_path
      expect(response).to have_http_status(200)
    end
  end
end
