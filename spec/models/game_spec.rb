require 'rails_helper'

RSpec.describe Game, type: :model do
  before(:each) do
    @user = User.create(username: 'Pedro')
    @game = @user.games.create(
      name: 'Test game',
      description: 'Test game description',
      icon: 'http//test.com/image25123',
      price: 145,
      category: 'Horror'
    )
  end

  it 'Marks as invalid if you do not put a name' do
    @game.name = ''
    expect(@game).to be_invalid
  end

  it 'Marks as invalid if the name exceeds 50 characters' do
    @game.name = 'Something1Something1Something1Something1Something10'
    expect(@game).to be_invalid
  end

  it 'Marks as invalid if you do not put a description' do
    @game.description = ''
    expect(@game).to be_invalid
  end

  it 'Marks as invalid if the description exceeds 500 characters' do
    @game.description = '
    Something1Something1Something1Something1Something1Something1Something1Something1Something1Something1
    Something1Something1Something1Something1Something1Something1Something1Something1Something1Something1
    Something1Something1Something1Something1Something1Something1Something1Something1Something1Something1
    Something1Something1Something1Something1Something1Something1Something1Something1Something1Something1
    Something1Something1Something1Something1Something1Something1Something1Something1Something1Something10
    '
    expect(@game).to be_invalid
  end

  it 'Marks as invalid if you do not put a icon' do
    @game.icon = ''
    expect(@game).to be_invalid
  end

  it 'Marks as invalid if the icon exceeds 255 characters' do
    @game.icon = '
    Something1Something1Something1Something1Something1Something1Something1Something1Something1Something1
    Something1Something1Something1Something1Something1Something1Something1Something1Something1Something1
    Something1Something1Something1Something1Something1Something1Something1Something1Something1Something1
    '
    expect(@game).to be_invalid
  end

  it 'Marks as invalid if you do not put a price' do
    @game.price = nil
    expect(@game).to be_invalid
  end

  it 'Marks as invalid if the price is less or equal to 0' do
    @game.price = -1
    expect(@game).to be_invalid
  end

  it 'Marks as invalid if the price is not a number' do
    @game.price = 'a'
    expect(@game).to be_invalid
  end

  it 'Marks as invalid if you do not put a category' do
    @game.category = ''
    expect(@game).to be_invalid
  end

  it 'Marks as invalid if the category exceeds 50 characters' do
    @game.category = 'Something1Something1Something1Something1Something10'
    expect(@game).to be_invalid
  end

  it 'Marks as valid if everything else passes' do
    expect(@game).to be_valid
  end
end