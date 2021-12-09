# require 'swagger_helper'

# RSpec.describe 'api/games', type: :request do
#   before(:all) do
#     User.create(username: 'Joao')
#   end
#   path '/api/sign_up' do

#     post 'Creates a user' do
#       tags 'User'
#       consumes 'application/json'
#       parameter name: :username, in: :body, schema: {
#         type: :object,
#         properties: {
#           username: { type: :string }
#         },
#         required: [ 'username' ]
#       }

#       response '200', 'User created' do
#         let(:username) { { username: 'Miguelangel' } }
#         run_test!
#       end

#       response '200', 'User already exists' do
#         let(:username) { { username: 'Joao' } }
#         run_test! do |response|
#           data = JSON.parse(response.body)
#           expect(data['error']).to eq(['Username has already been taken'])
#         end
#       end

#       response '200', 'Username cannot be empty' do
#         let(:username) { {} }
#         run_test! do |response|
#           data = JSON.parse(response.body)
#           expect(data['error']).to eq(["Username can't be blank"])
#         end
#       end
#     end
#   end
# end