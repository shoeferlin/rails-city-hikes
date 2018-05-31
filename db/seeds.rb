# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "SEEDING STARTED"

puts "Generating users ..."

users = []

users << User.create(first_name: "Felix", username: "@felix", password: 123456, email: "felix.fastrich@gmail.com", picture_url: "https://picsum.photos/200/300/?random")
users << User.create(first_name: "Johnny", username: "@johnny", password: 123456, email: "johnny.lohner@gmail.com", picture_url: "https://picsum.photos/200/300/?random")
users << User.create(first_name: "Nathan", username: "@nathan", password: 123456, email: "nathan.lebas@gmail.com", picture_url: "https://picsum.photos/200/300/?random")
users << User.create(first_name: "Simon", username: "@simon", password: 123456, email: "simon.hoeferlin@gmail.com", picture_url: "https://picsum.photos/200/300/?random")

11.times do
  first_name  = Faker::Name.first_name
  last_name   = Faker::Name.last_name
  users << User.create(first_name: first_name, username: "@" + first_name[0].downcase + last_name.downcase, password: Faker::Internet.password(8), email: Faker::Internet.free_email("#{last_name} #{first_name}"), picture_url: "https://avatar.tobi.sh/tobiaslins.svg?text=#{first_name[0]}#{last_name[0]}")
end

puts "Generating cities ..."

berlin      = City.create(locality: "Berlin", country: "DE")
paris       = City.create(locality: "Paris", country: "FR")
london      = City.create(locality: "London", country: "GB")
barcelona   = City.create(locality: "Barcelona", country: "DE")
amsterdam   = City.create(locality: "Amsterdam", country: "NL")
zurich      = City.create(locality: "Zurich", country: "CH")
rome        = City.create(locality: "Rome", country: "IT")
copenhhagen = City.create(locality: "Copenhagen", country: "DK")

puts "Generating sights ..."

sights = []
20.times do
  sights << Sight.create(name: Faker::Ancient.god, description: Faker::ChuckNorris.fact, category: Faker::Ancient.titan, picture_url: "https://picsum.photos/200/300/?random", longitude: Faker::Address.longitude, latitude: Faker::Address.latitude, place_id: "empty", url: "www.wikipedia.org", website: "www.wikipedia.org", formatted_address: "empty")
end

sights << Sight.create(name: "Checkpoint Charlie", description: "Checkpoint Charlie was the name given by the Western Allies to the best-known Berlin Wall crossing point between East Berlin and West Berlin during the Cold War.", latitude: 52.5074, longitude: 13.3904, place_id: "ChIJzdgmXNFRqEcRyIl9R0IApSM", formatted_address: "Friedrichstraße 43-45, 10117 Berlin, Deutschland")

puts "Generating routes ..."

6.times do
  Route.create(user_id: users.sample.id, city_id: berlin.id, name: Faker::Name.title , description: Faker::ChuckNorris.fact, public: true )
end

puts "Generating waypoints ..."

Route.all.each do |route|
  sights.sample(20).each do |sight|
    w = Waypoint.new(route_id: route.id, sight_id: sight.id)
    w.save
  end
end

puts "SEEDING COMPLETED"
