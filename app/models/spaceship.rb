class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :location, :cost, presence: true
end
