require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @user = User.create(username: 'Lorenzo')
    @game = @user.games.create(
      name: 'Test game',
      description: 'Test game description',
      icon: 'http//test.com/image25123',
      price: 145,
      category: 'Horror',
    )
    @reservation = Reservation.create(
      reservation_date: '2021-09-12',
      retrieval_date: '2021-10-12',
      location: 'New York',
      buyer_id: @user.id,
      game_id: @game.id
    )
  end

  context 'Create a new Reservation' do
    it 'Marks as invalid if there is no reservation_date' do
      @reservation.reservation_date = nil
      expect(@reservation).to be_invalid
    end

    it 'Marks as invalid if there is no retrieval_date' do
      @reservation.retrieval_date = nil
      expect(@reservation).to be_invalid
    end

    it 'Marks as invalid if there is no location' do
      @reservation.location = nil
      expect(@reservation).to be_invalid
    end

    it 'Marks as invalid if the location exceeds 50 characters' do
      @reservation.location = 'Something1Something1Something1Something1Something10'
      expect(@reservation).to be_invalid
    end

    it 'Marks as invalid if there is no buyer_id' do
      @reservation.buyer_id = nil
      expect(@reservation).to be_invalid
    end

    it 'Marks as invalid if there is no game_id' do
      @reservation.game_id = nil
      expect(@reservation).to be_invalid
    end

    it 'Marks as valid if everything else passes' do
      expect(@reservation).to be_valid
    end
  end
end
