# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Permissions API' do

  path '/api/v1/permissions' do

    post 'Creates a permission' do
      tags 'Permission'
      consumes 'application/json', 'application/xml'
      parameter name: :permission, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'permission created successfull' do
        let(:permission) { { name: 'CanViewProductPrizes' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:permission) { { name: 'CanViewProductPrizes' } }
        run_test!
      end
    end
  end

  path '/api/v1/permissions/{id}' do

    get 'Retrieves a permission' do
      tags 'Permissions'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string }
          },
          required: [ 'id', 'name' ]

        let(:id) { Permission.create(name: 'cancreateproduct').id }
        run_test!
      end

      response '404', 'permission not found' do
        let(:id) { 'invalid' }
        run_test!
      end

    end

  end

end
