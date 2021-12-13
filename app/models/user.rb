class User < ApplicationRecord
  has_many :games, foreign_key: 'owner_id'
  has_many :reservations, foreign_key: 'buyer_id'

  validates :username, presence: true, uniqueness: true
end
