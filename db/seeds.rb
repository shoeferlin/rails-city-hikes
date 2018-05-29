# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Seeding"

puts "Generate users"
users = []
3.times do
  users << User.create(first_name: Faker::Name.first_name, username: Faker::Cat.name, email: Faker::Internet.email, picture_url: "https://picsum.photos/200/300/?random", password: Faker::Internet.password)
end
User.create(first_name: "Magic", username: "magicmike", email: "magic@mike.com", password: "123456", picture_url: "https://avatarfiles.alphacoders.com/547/54795.jpg")

puts "Generating cities"
  berlin = City.create(locality: "Berlin", country: "DE", lng: Faker::Address.longitude, lat: Faker::Address.latitude, picture_url: "http://www.6am-group.com/wp-content/uploads/2016/08/Berlin.jpg", photo: "")

puts "Generating sights"
sights = []
20.times do
  sights << Sight.create(name: Faker::Ancient.god, description: Faker::ChuckNorris.fact, category: Faker::Ancient.titan, picture_url: "https://picsum.photos/200/300/?random", lng: Faker::Address.longitude, lat: Faker::Address.latitude)
end

puts "Generating routes"
6.times do
  Route.create(user_id: users.sample.id, city_id: berlin.id, name: Faker::Name.title , description: Faker::ChuckNorris.fact, public: true )
end

puts "Generating waypoints"

Route.all.each do |route|
  sights.sample(5).each do |sight|
    w = Waypoint.new(route_id: route.id, sight_id: sight.id)
    w.save
  end
end

puts "Seeding done"


