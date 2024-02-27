class Spaceship < ApplicationRecord
  belongs_to :user
  validates :name, :location, :cost, presence: true
  has_one_attached :photo
end
