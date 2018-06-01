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

users << User.create(first_name: "Felix", username: "@felix", password: 123456, email: "felix@city-hikes.com", picture_url: "image/upload/v1527786929/u3rygis7vptbmshvqttw.jpg")
users << User.create(first_name: "Johnny", username: "@johnny", password: 123456, email: "johnny@gcity-hikes.com", picture_url: "image/upload/v1527786726/anbde5rrrq4yxk6nbj9m.jpg")
users << User.create(first_name: "Nathan", username: "@nathan", password: 123456, email: "nathan@city-hikes.com", picture_url: "image/upload/v1527787017/xvqw3svmlh2wad7ju27h.jpg")
users << User.create(first_name: "Simon", username: "@simon", password: 123456, email: "simon@city-hikes.com", picture_url: "image/upload/v1527786840/qtsanl4o6xmgzdg6nxhi.jpg")

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

# -------------
# 47.367089, 8.5450858

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

puts "Generating Zürich Route"
zürichsights = []
zürichsights << Sight.create(name: "Grossmünster", description: "Das Grossmünster ist eine evangelisch-reformierte Kirche in der Altstadt von Zürich. Die Kirchenpatrone sind Felix und Regula sowie Exuperantius. Bis zur Reformation war das Grossmünster zugleich Teil eines weltlichen Chorherrenstifts und Pfarrkirche. Das Grossmünster gehört zusammen mit dem Fraumünster und der St. Peter-Kirche zu den bekanntesten Kirchen der Stadt Zürich.", latitude: 47.370093, longitude: 8.544054, place_id: "X", formatted_address: "Grossmünsterplatz, 8001 Zürich, Schweiz", picture_url:"https://i1.wp.com/magic-places.ch/wp-content/uploads/2013/09/Das-Zurcher-Grossmunster-bei-Nacht.jpg?ssl=1")
zürichsights << Sight.create(name: "Framünster", description: "Das Kloster Fraumünster war ein Benediktinerinnen-Stift in Zürich (Kanton Zürich, Schweiz). Die ehemalige Klosterkirche ist eines der Wahrzeichen und eine der vier Altstadtkirchen Zürichs. ", latitude: 47.37, longitude: 8.544167, place_id: "Y", formatted_address: "Münsterhof 2, 8001 Zürich, Schweiz", picture_url:"https://upload.wikimedia.org/wikipedia/commons/b/ba/Z%C3%BCrich_-_Stadthaus_-_Fraum%C3%BCnster_-_Sicht_vom_Grossm%C3%BCnster_Karlsturm_IMG_6396.JPG")
zürichsights << Sight.create(name: "Paradeplatz", description: "Der Paradeplatz ist ein Platz an der Bahnhofstrasse im Quartier City in Zürich. Er liegt an einer der teuersten Lagen der Stadt und ist seit Jahren ein Synonym für Banken und den Schweizer Wohlstand. Direkt am Paradeplatz befinden sich unter anderem die beiden Schweizer Grossbanken UBS und Credit Suisse. In der näheren Umgebung sind zudem eine ganze Reihe weiterer Banken beheimatet. ", latitude: 50.9105494, longitude: 9.2346855, place_id: "Z", formatted_address: "Paradeplatz, 8001 Zürich, Schweiz", picture_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Paradeplatz_2011-08-01_16-36-10_ShiftN.jpg/1920px-Paradeplatz_2011-08-01_16-36-10_ShiftN.jpg")
# zürichsights << Sight.create(name: "Bellevueplatz", description: "Das Bellevue ist ein weitläufiger, zentraler Platz im Herzen von Zürich und ein wichtiger städtischer Verkehrsknotenpunkt. Er liegt am Südende der Altstadt an der rechten Seite des Abflusses des Zürichsees in die Limmat.", latitude: ‎0, longitude: 0, place_id: "ZX", formatted_address: "Bellevueplatz, 8001 Zürich, Schweiz", picture_url:"https://upload.wikimedia.org/wikipedia/commons/2/2a/Bellevue_%28Z%C3%BCrich%29_-_Theaterstrasse_2013-04-15_13-17-17.JPG")

zürichroute = Route.create(user_id: 2, city_id: zurich.id, name: "Zürich Historical Route", description: "Beautiful route through old city center with historical buildings", public: true )
zürichsights.each do |zürichsight|
  Waypoint.create(route_id: zürichroute.id, sight_id: zürichsight.id)
end

puts "SEEDING COMPLETED"
