# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Roles API' do

  path '/api/v1/roles' do

    post 'Creates a user role' do
      tags 'Role'
      consumes 'application/json', 'application/xml'
      parameter name: :role, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'role created successfull' do
        let(:role) { { name: 'Supplier' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:role) { { name: 'Supplier' } }
        run_test!
      end
    end
  end

  path '/api/v1/roles/{id}' do

    get 'Retrieves a role' do
      tags 'Roles'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'role found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string }
          },
          required: [ 'id', 'name' ]

        let(:id) { Role.create(name: 'SuperAdmin').id }
        run_test!
      end

      response '404', 'record not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end