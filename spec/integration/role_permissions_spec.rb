# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Role Permissions API' do

  path '/api/v1/role_permissions' do

    post 'Creates a role permission' do
      tags 'Role Permission'
      consumes 'application/json', 'application/xml'
      parameter name: :role_permission, in: :body, schema: {
        type: :object,
        properties: {
          role_id: { type: :integer },
          permission_id: { type: :integer}
        },
        required: ['role_id','permission_id']
      }

      response '201', 'role permissiin created successfull' do
        let(:role_permission) { { role_id: 1, permission_id: 23 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:role_permission) { { role_id: 1 } }
        run_test!
      end
    end
  end

  path '/api/v1/role_permissions/{id}' do

    get 'Retrieves role permissions' do
      tags 'Role Permissions'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'record found' do
        schema type: :array,
          properties: [{
            role_id: { type: :integer },
            permission_id: { type: :integer }
          }],
          required: [ 'role_id', 'permission_id' ]

        let(:id) { RolePermission.create(RoleId: 233,PermissionId: 200).id }
        run_test!
      end

      response '404', 'record not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end