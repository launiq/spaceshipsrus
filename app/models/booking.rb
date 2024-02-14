class Booking < ApplicationRecord
  belongs_to :spaceship
  belongs_to :user
end
