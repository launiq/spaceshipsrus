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

##SUDO
# create 10 users
# create 10 spaceships
# for each user, create 1 spaceship


p "creating 10 users"
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
  p "First Name:\t\t#{user.first_name}\n \
      Last Name:\t\t#{user.last_name}\n \
      Email:\t\t#{user.email}\n\n"
end

for user in User.all
  spaceship = Spaceship.new(
    location:           Faker::Space.star_cluster,
    name:               Faker::Space.launch_vehicle,
    cost:               rand(1000..10000),
    user:               user
  )
  spaceship.save!
  p " Spaceship name:\t\t#{spaceship.name}\n
      Cost:\t\t#{spaceship.cost}\n
      Owner:\t\t#{user.first_name}\n\n"
end
