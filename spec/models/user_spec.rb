require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user1 = User.create(username: 'José')
    @user2 = User.create(username: 'José')
  end

  context 'Create a user' do
    it 'Marks as invalid if the username does not exit' do
      @user1.username = nil
      expect(@user1).to be_invalid
    end

    it 'Marks as invalid if the username is not unique' do
      expect(@user2).to be_invalid
    end

    it 'Marks as invalid if the username exceeds 30 characters' do
      @user1.username = 'Something1Something1Something10'
      expect(@user1).to be_invalid
    end

    it 'Marks as valid if everything else passes' do
      expect(@user1).to be_valid
    end
  end
end
