class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :location, :cost, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_name_and_location,
  against: [ :name, :location ],
  using: {
    tsearch: { prefix: true }
  }
end
