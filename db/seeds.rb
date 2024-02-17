# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
first_user = User.create!(email: "pirula@gmail.com", password: "123456")
second_user = User.create!(email: "pirulo@gmail.com", password: "123456")

Spaceship.create!(name: "Enterprise", location: "London", cost: 900, user_id: first_user.id)
Spaceship.create!(name: "Millenium Falcon", location: "New York", cost: 800, user_id: second_user.id)
Spaceship.create!(name: "USS Voyager", location: "Paris", cost: 700, user_id: first_user.id)
