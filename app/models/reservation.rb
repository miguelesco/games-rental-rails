class Reservation < ApplicationRecord
  belongs_to :buyer, class_name: 'User'
  belongs_to :game

  validates :buyer_id, presence: true
  validates :game_id, presence: true
  validates :reservation_date, presence: true
  validates :retriaval_date, presence: true
  validates :location, presence: true, length: { maximum: 50 }
end
