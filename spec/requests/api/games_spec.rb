require 'swagger_helper'

RSpec.describe 'Games', type: :request do
  before(:all) do
    @user = User.create(username: 'Petter')
    new_game = {
      name: 'Mario Bros',
      description: 'A classic game',
      icon: 'https://upload.wikimedia.org/wikipedia/en/thumb/7/7f/Super_Mario_Bros.jpg/220px-Super_Mario_Bros.jpg',
      price: 10,
      category: 'Action',
      owner_id: @user.id
    }
    @game = Game.create(new_game)
  end

  path '/api/games/new' do
    post 'Creates a new game' do
      tags 'Games'
      consumes 'application/json'
      parameter name: :game, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          icon: { type: :string },
          price: { type: :integer },
          category: { type: :string },
          owner_id: { type: :integer }
        },
        required: [ 'name', 'description', 'icon', 'price', 'category', 'owner' ]
      }

      response '200', 'game created' do
        let(:game) { 
          { 
            name: 'Super Mario Bros', 
            description: 'A classic game', 
            icon: 'https://upload.wikimedia.org/wikipedia/en/thumb/7/7f/Super_Mario_Bros.jpg/220px-Super_Mario_Bros.jpg', 
            price: 10, 
            category: 'Action', 
            owner_id: @user.id 
          } 
        }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['error']).to eq(nil)
        end
      end

      response '422', 'invalid request' do
        let(:game) { { name: 'Super Mario Bros' } }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['error']).to eq(["Owner must exist", "Description can't be blank", "Owner can't be blank", "Price can't be blank", "Price is not a number", "Category can't be blank", "Icon can't be blank"])
        end
      end
    end
  end

  path '/api/games' do
    get 'Retrieves all games' do
      tags 'Games'
      produces 'application/json'

      response '200', 'games retrieved' do
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['error']).to eq(nil)
        end
      end
    end
  end

  path '/api/games/{id}/delete' do
    delete 'Deletes a game' do
      tags 'Games'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'game deleted' do
        let(:id) { @game.id }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['message']).to eq('Successfully deleted')
        end
      end
    end
  end

end

