require 'swagger_helper'

RSpec.describe 'Reservation', type: :request do
  before(:all) do
    @user = User.create(username: 'Alex')
    new_game = {
      name: 'Valorant',
      description: 'A shooter game',
      icon: 'https://upload.wikimedia.org/wikipedia/en/thumb/7/7f/Super_Mario_Bros.jpg/220px-Super_Mario_Bros.jpg',
      price: 10,
      category: 'Shooter',
      owner_id: @user.id
    }
    @game = Game.create(new_game)

    @reservation = Reservation.create(
      buyer_id: @user.id,
      game_id: @game.id,
      reservation_date: '2020-01-01',
      retrieval_date: '2020-01-02',
      location: 'Somewhere'
    )
  end

  path '/api/reservation/new' do
    post 'Creates a new reservation' do
      tags 'Reservations'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          retrieval_date: { type: :string },
          reservation_date: { type: :string },
          location: { type: :string },
          game_id: { type: :integer },
          buyer_id: { type: :integer }
        },
        required: %w[game_id buyer_id retrieval_date reservation_date location]
      }

      response '200', 'reservation created' do
        let(:reservation) do
          { retrieval_date: '2021-12-12', reservation_date: '2021-12-8', location: 'Venezuela', game_id: @game.id,
            buyer_id: @user.id }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { { game_id: nil } }
        run_test!
      end
    end
  end

  path '/api/reservation/{id}/update' do
    put 'Updates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          retrieval_date: { type: :string },
          reservation_date: { type: :string },
          location: { type: :string },
          game_id: { type: :integer },
          buyer_id: { type: :integer }
        },
        required: %w[game_id buyer_id retrieval_date reservation_date location]
      }

      response '200', 'reservation updated' do
        let(:id) { @reservation.id }
        let(:reservation) { { retrieval_date: '2021-12-15', reservation_date: '2021-12-2' } }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['message']).to eq('Successfully Updated')
        end
      end

      response '422', 'invalid request' do
        let(:id) { @reservation.id }
        let(:reservation) { {} }
        run_test!
      end
    end
  end

  path '/api/reservation/{id}/delete' do
    delete 'Deletes a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'reservation deleted' do
        let(:id) { @reservation.id }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['message']).to eq('Successfully Deleted')
        end
      end
    end
  end
end
