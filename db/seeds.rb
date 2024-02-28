# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#hello world
# Seeds with faker gem

# create 10
## require faker
require 'faker'
require 'net/http'
require 'json'
require 'open-uri'

def fetch_random_rocket_image_url
  access_key = 'QtdL7d3ZYdpYG93LRVTz69p6guthSgo0qF5qnRJYrM4'
  uri = URI("https://api.unsplash.com/photos/random/?query=rocket&client_id=#{access_key}")
  response = Net::HTTP.get_response(uri)
  data = JSON.parse(response.body)
  data['urls']['regular']
end

p "creating 20 users"


20.times do
  user = User.new(
    first_name:             Faker::Name.first_name,
    last_name:              Faker::Name.last_name,
    phone_number:           Faker::PhoneNumber.cell_phone,
    email:                  Faker::Internet.email,
    password:               "123456",
    password_confirmation:  "123456"
  )
  user.save!
  file = URI.open(fetch_random_rocket_image_url)
  spaceship = Spaceship.new(
    location:           Faker::Space.star_cluster,
    name:               Faker::Space.launch_vehicle,
    cost:               rand(1000..10000),
    user:               user
    )
  spaceship.photo.attach(io: file, filename: "#{Faker::Space.launch_vehicle}.jpg", content_type: 'image/jpg')
  spaceship.save!
end

p "creating 10 spaceships for each user DONE!"
