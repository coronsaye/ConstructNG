require 'swagger_helper'

describe 'Users API' do

    path '/api/v1/users' do

        get 'Retrieves all users' do
        tags 'GetAllUserss'
        produces 'application/json', 'application/xml'


        response '200', 'Success' do
            schema type: :object,
            properties:
                {
                id: { type: :integer },
                email: { type: :string },
                phone_no:  { type: :string },
                username:  { type: :string },
                status:  { type: :string },
                password:  { type: :string },
                default_password:  { type: :string },
                parent:  { type: :integer }
            },
            required: [ 'id', 'username', 'email','default_password']

            let(:users) { User.all }
            run_test!
        end

        response '404', 'records not not' do
            let(:id) { 'invalid' }
            run_test!
        end

        end
    end

end
