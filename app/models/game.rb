class Game < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :reservations, dependent: :delete_all

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :owner_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true, length: { maximum: 50 }
  validates :icon, presence: true, length: { maximum: 255 }
end
