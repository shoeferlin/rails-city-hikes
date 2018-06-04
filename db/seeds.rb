# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "SEEDING STARTED"

### USERS ###
puts "Generating users ..."

users = []

# 01 User
users << User.create(first_name: "Felix", username: "@felix", password: 123456, email: "felix@city-hikes.com",remote_picture_url_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1527786929/u3rygis7vptbmshvqttw.jpg")
# 02 User
users << User.create(first_name: "Johnny", username: "@johnny", password: 123456, email: "johnny@city-hikes.com", remote_picture_url_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1527786726/anbde5rrrq4yxk6nbj9m.jpg")
# 03 User
users << User.create(first_name: "Nathan", username: "@nathan", password: 123456, email: "nathan@city-hikes.com", remote_picture_url_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1527787017/xvqw3svmlh2wad7ju27h.jpg")
# 04 User
users << User.create(first_name: "Simon", username: "@simon", password: 123456, email: "simon@city-hikes.com", remote_picture_url_url: "https://cloudinary.com/console/media_library/asset/image/upload/qtsanl4o6xmgzdg6nxhi")

# Other users
11.times do
  first_name  = Faker::Name.first_name
  last_name   = Faker::Name.last_name
  users << User.create(first_name: first_name, username: "@" + first_name[0].downcase + last_name.downcase, password: Faker::Internet.password(8), email: Faker::Internet.free_email("#{last_name} #{first_name}"), picture_url: "https://avatar.tobi.sh/tobiaslins.svg?text=#{first_name[0]}#{last_name[0]}")
end


### CITIES ###
puts "Generating cities ..."

# 01 City
berlin      = City.create(locality: "Berlin", country: "DE", remote_photo_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1528124752/z0dcxzuts9oielxrwiav.jpg")
# 02 City
munich      = City.create(locality: "Munich", country: "DE", remote_photo_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1528124745/sx988bpb9sl82mim7rg5.jpg")
# 03 City
paris       = City.create(locality: "Paris", country: "FR", remote_photo_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1528124749/wsmhxeslstpymmwiktws.jpg")
# 04 City
london      = City.create(locality: "London", country: "GB", remote_photo_url: "https://images.unsplash.com/photo-1508711046474-2f4c2d3d30ca?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d9753d35c4f5b62442eb81568033ddc2&auto=format&fit=crop&w=2250&q=80")
# 05 City
barcelona   = City.create(locality: "Barcelona", country: "ES", remote_photo_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1528124741/ggcijd2dtdakjaw8s632.jpg")
# 06 City
amsterdam   = City.create(locality: "Amsterdam", country: "NL", remote_photo_url: "https://images.unsplash.com/photo-1468436385273-8abca6dfd8d3?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e71160983b3af78d30b19751a9574ce4&auto=format&fit=crop&w=2194&q=80")
# 07 City
zurich      = City.create(locality: "Zurich", country: "CH", remote_photo_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1528124750/f2ia345osm1py34r95wg.jpg")
# 08 City
rome        = City.create(locality: "Rome", country: "IT", remote_photo_url: "https://images.unsplash.com/photo-1522460676881-83490b51a873?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94aaccf321f4962bff0ed0236879d2b0&auto=format&fit=crop&w=3289&q=80")
# 09 City
copenhhagen = City.create(locality: "Copenhagen", country: "DK", remote_photo_url: "https://images.unsplash.com/photo-1445168580797-f946f0688547?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bbd5443b70b8bf661b89340ec61bf4d7&auto=format&fit=crop&w=2250&q=80")
# 10 City
basel       = City.create(locality: "Basel", country: "CH", remote_photo_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1528125517/eejimk3koqhtx2tuhm6z.jpg")


### SIGHTS ###
puts "Generating sights ..."

# 01 Sight - Munich
Sight.create(name: "Marienplatz", description: nil, latitude: 48.1373932, longitude: 11.5754485, place_id: "ChIJLWM3jSROqEcRswsOX7NRrd4", url: "https://maps.google.com/?cid=16045570878226697139", website: "http://www.muenchen.de/sehenswuerdigkeiten/orte/120347.html", formatted_address: "Marienplatz 1, 80331 München, Deutschland")
# 02 Sight - Munich
Sight.create(name: "Odeonsplatz", description: nil, latitude: 48.1434636, longitude: 11.5779133, place_id: "ChIJ-UVJMo11nkcRFMwLk9wFaGM", url: "https://maps.google.com/?cid=7162981652250741780", website: "http://www.muenchen.de/sehenswuerdigkeiten/orte/120341.html", formatted_address: "Odeonspl. 1, 80539 München, Deutschland")
# 03 Sight - Munich
Sight.create(name: "Konigsplatz", description: nil, latitude: 48.1458636, longitude: 11.5645507, place_id: "ChIJmyAZAvB1nkcRAQUQaHrttRI", url: "https://maps.google.com/?q=K%C3%B6nigsplatz,+80333+M%C3%BCnchen,+Deutschland&ftid=0x479e75f00219209b:0x12b5ed7a68100501", website: "undefined", formatted_address: "Königsplatz, 80333 München, Deutschland")
# 04 Sight - Munich
Sight.create(name: "Café im Vorhoelzer Forum", description: nil,  latitude: 48.1486686, longitude: 11.5685941, place_id: "ChIJrRdqUO91nkcROzFfYdW0mjM", url: "https://maps.google.com/?cid=3718483270902427963", website: "http://www.vf.ar.tum.de/", formatted_address: "Arcisstraße 21, 80333 München, Deutschland")
# 05 Sight - Munich
Sight.create(name: "Ludwig-Maximilians-Universität München", description: nil, latitude: 48.150806, longitude: 11.58043, place_id: "ChIJAVetl5NynkcRNL_VO8PwEro", url: "https://maps.google.com/?cid=13408043761948540724", website: "http://www.uni-muenchen.de/", formatted_address: "Geschwister-Scholl-Platz 1, 80539 München, Deutschland")
# 06 Sight - Munich
Sight.create(name: "Chinesischer Turm", description: nil, latitude: 48.152561, longitude: 11.5921159, place_id: "ChIJtSFa5Jd1nkcRH5H1ZGe3kJI", url: "https://maps.google.com/?cid=10561142780887142687", website: "undefined", formatted_address: "80538 München, Deutschland")
# 07 Sight - Munich
Sight.create(name: "Eisbachwelle", description: nil, latitude: 48.1435506, longitude: 11.5877938, place_id: "ChIJeS3H1Y91nkcRYKcxKknvY8U", url: "https://maps.google.com/?cid=14223475145685706592", website: "http://www.muenchen.de/freizeit/sport/surfen.html", formatted_address: "Prinzregentenstraße, 80538 München, Deutschland")
# 08 Sight - Munich
Sight.create(name: "Hofbräukeller am Wiener Platz", description: nil, latitude: 48.134095, longitude: 11.595478, place_id: "ChIJ29wi64B1nkcRR5UyRpxvUm4", url: "https://maps.google.com/?cid=7949539009245648199", website: "http://www.hofbraeukeller.de/", formatted_address: "Innere Wiener Straße 19, 81667 München, Deutschland")
# 09 Sight - Munich
Sight.create(name: "Deutsches Museum", description: nil, latitude: 48.1298707, longitude: 11.5834522, place_id: "ChIJHQl2M33fnUcRUWSjmZtwrgo", url: "https://maps.google.com/?cid=769676399926797393", website: "undefined", formatted_address: "80538 München, Deutschland")
# 10 Sight - Munich(
Sight.create(name: "Isartor", description: nil, latitude: 48.1351113, longitude: 11.5821208, place_id: "ChIJg-Bu7Il1nkcR1XYh_kKr8pE", url: "https://maps.google.com/?cid=10516656384083326677", website: "http://www.muenchen.de/sehenswuerdigkeiten/orte/120456.html", formatted_address: "Tal 43, 80331 München, Deutschland")
# 11 Sight - Munich
Sight.create(name: "Viktualienmarkt", description: nil, latitude: 48.1351143, longitude: 11.5762549, place_id: "ChIJF-xkv4p1nkcRwSyIRoms9ik", url: "https://maps.google.com/?cid=3023793905419693249", website: "http://www.viktualienmarkt.de/", formatted_address: "Viktualienmarkt 3, 80331 München, Deutschland")
# 12 Sight - Munich
Sight.create(name: "Rindermarkt", description: nil, latitude: 48.1361191, longitude: 11.5738395, place_id: "ChIJp5KXNPV1nkcRsY3gf1_wz0Y", url: "https://maps.google.com/?q=Rindermarkt,+80331+M%C3%BCnchen,+Deutschland&ftid=0x479e75f5349792a7:0x46cff05f7fe08db1", website: "undefined", formatted_address: "Rindermarkt, 80331 München, Deutschland")
# 13 Sight - London
Sight.create(name: "The Harry Potter Shop at Platform 9 3/4", description: nil, latitude: 51.5321845, longitude: -0.1239217, place_id: "ChIJJe7ZEDwbdkgRCHZ9Qztth8w", url: "https://maps.google.com/?cid=14737868406896031240", website: "https://www.harrypotterplatform934.com/", formatted_address: "Kings Cross Station, Kings Cross, London N1 9AP, Vereinigtes Königreich")
# 14 Sight - London
Sight.create(name: "Covent Garden", description: nil, latitude: 51.5117797, longitude: -0.1231911, place_id: "ChIJs4GOh8sEdkgRRiBFZKMP8ZE", url: "https://maps.google.com/?q=Covent+Garden,+London+WC2E+8BE,+Vereinigtes+K%C3%B6nigreich&ftid=0x487604cb878e81b3:0x91f10fa364452046", website: "undefined", formatted_address: "Covent Garden, London WC2E 8BE, Vereinigtes Königreich")
# 15 Sight - London
Sight.create(name: "London Eye", description: nil, latitude: 51.503324, longitude: -0.119543, place_id: "ChIJc2nSALkEdkgRkuoJJBfzkUI", url: "https://maps.google.com/?cid=4796882358840715922", website: "http://www.londoneye.com/", formatted_address: "Lambeth, London SE1 7PB, Vereinigtes Königreich")
# 16 Sight - London
Sight.create(name: "Big Ben", description: nil, latitude: 51.5007292, longitude: -0.1246254, place_id: "ChIJ2dGMjMMEdkgRqVqkuXQkj7c", url: "https://maps.google.com/?cid=13226830714359798441", website: "http://www.parliament.uk/bigben", formatted_address: "Westminster, London SW1A 0AA, Vereinigtes Königreich")
# 17 Sight - London
Sight.create(name: "Buckingham Palace", description: nil, latitude: 51.501364, longitude: -0.14189, place_id: "ChIJtV5bzSAFdkgRpwLZFPWrJgo", url: "https://maps.google.com/?cid=731461058599387815", website: "https://www.royalcollection.org.uk/visit/the-state-rooms-buckingham-palace", formatted_address: "Westminster, London SW1A 1AA, Vereinigtes Königreich")
# 18 Sight - London
Sight.create(name: "Kensington Palace", description: nil, latitude: 51.5058372, longitude: -0.1877239, place_id: "ChIJ7w-V58oNdkgRhz8svCpc5ok", url: "https://maps.google.com/?cid=9936730966454976391", website: "http://www.hrp.org.uk/kensingtonpalace/", formatted_address: "Kensington Gardens, London W8 4PX, Vereinigtes Königreich")
# 19 Sight - Zurich
Sight.create(name: "Grossmünster", description: nil, latitude: 47.3700931, longitude: 8.544054, place_id: "ChIJZWHfSaqgmkcREF9TlBQlGkk", url: "https://maps.google.com/?cid=5267563484481281808", website: "http://www.grossmuenster.ch/", formatted_address: "Grossmünsterplatz, 8001 Zürich, Schweiz")
# 20 Sight - Zurich
Sight.create(name: "Fraumünster", description: nil, latitude: 47.3697263, longitude: 8.541363, place_id: "ChIJe6TskqmgmkcRuoNn0YcMfqU", url: "https://maps.google.com/?q=Fraum%C3%BCnster,+8001+Z%C3%BCrich,+Schweiz&ftid=0x479aa0a992eca47b:0xa57e0c87d16783ba", website: "undefined", formatted_address: "Fraumünster, 8001 Zürich, Schweiz")
# 21 Sight - Zurich
Sight.create(name: "Paradeplatz", description: nil, latitude: 47.3697169, longitude: 8.5389227, place_id: "ChIJHYeS-AAKkEcRqsyc1rHPZN4", url: "https://maps.google.com/?cid=16025161736807828650", website: "http://www.zuerich.com/de/besuchen/sehenswuerdigkeiten/paradeplatz", formatted_address: "8001 Zürich, Schweiz")
# 22 Sight - Zurich
Sight.create(name: "Bellevueplatz", description: nil, latitude: 47.3674026, longitude: 8.5452856, place_id: "ChIJ1eMiRKugmkcRItG-L2hqlHs", url: "https://maps.google.com/?q=Bellevuepl.,+8001+Z%C3%BCrich,+Schweiz&ftid=0x479aa0ab4422e3d5:0x7b946a682fbed122", website: "undefined", formatted_address: "Bellevuepl., 8001 Zürich, Schweiz")


### ROUTES ###
puts "Generating routes ..."

# Munich 01
Route.create(name: "Beautiful Munich in one afternoon", description: "Munich, Bavaria’s capital, is home to centuries-old buildings and numerous museums. The city is known for its annual Oktoberfest celebration and its beer halls, including the famed Hofbräuhaus, founded in 1589. In the Altstadt (Old Town), central Marienplatz square contains landmarks such as Neo-Gothic Neues Rathaus (town hall), with a popular glockenspiel show that chimes and reenacts stories from the 16th century.", public: true, user_id: 4, city_id: 2)
# London 02
Route.create(name: "The City", description: "London, the capital of England and the United Kingdom, is a 21st-century city with history stretching back to Roman times. At its centre stand the imposing Houses of Parliament, the iconic ‘Big Ben’ clock tower and Westminster Abbey, site of British monarch coronations. Across the Thames River, the London Eye observation wheel provides panoramic views of the South Bank cultural complex, and the entire city.", public: true, user_id: 4, city_id: 4)
# Zurich 03
Route.create(name: "Picturesque Zurich", description: "The city of Zurich, a global center for banking and finance, lies at the north end of Lake Zurich in northern Switzerland. The picturesque lanes of the central Altstadt (Old Town), on either side of the Limmat River, reflect its pre-medieval history. Waterfront promenades like the Limmatquai follow the river toward the 17th-century Rathaus (town hall).", public: true, user_id: 2, city_id: 7)


### ROUTE PICTURES ###
puts "Generating route pictures ..."

# Munich 01
RoutePicture.create(route_id: 1, remote_route_picture_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1528126466/pvpmkodn803rd6ygxbki.jpg")
RoutePicture.create(route_id: 1, remote_route_picture_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1528126461/dzhpry6hrzmss0wkqgf3.jpg")
RoutePicture.create(route_id: 1, remote_route_picture_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1528126447/skyshumx8dpbd8uugrlz.jpg")
RoutePicture.create(route_id: 1, remote_route_picture_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1528126464/tciudxnhd6ounlpxmi17.jpg")

# London 02
RoutePicture.create(route_id: 2, remote_route_picture_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1528126728/jaj1iprkvgy7brfwz55x.jpg")
RoutePicture.create(route_id: 2, remote_route_picture_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1528126732/ucehr34wxe74zzew3irr.jpg")
RoutePicture.create(route_id: 2, remote_route_picture_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1528126734/mqnsoqx23go2inn08hjn.jpg")

# Zurich 03
RoutePicture.create(route_id: 3, remote_route_picture_url: "https://images.pexels.com/photos/161138/grossmunster-church-tower-church-tower-161138.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")

### WAYPOINTS ###
puts "Generating waypoints ..."

# Munich
Waypoint.create(route_id: 1, sight_id: 1)
Waypoint.create(route_id: 1, sight_id: 2)
Waypoint.create(route_id: 1, sight_id: 3)
Waypoint.create(route_id: 1, sight_id: 4)
Waypoint.create(route_id: 1, sight_id: 5)
Waypoint.create(route_id: 1, sight_id: 6)
Waypoint.create(route_id: 1, sight_id: 7)
Waypoint.create(route_id: 1, sight_id: 8)
Waypoint.create(route_id: 1, sight_id: 9)
Waypoint.create(route_id: 1, sight_id: 10)
Waypoint.create(route_id: 1, sight_id: 11)
Waypoint.create(route_id: 1, sight_id: 12)
# London
Waypoint.create(route_id: 2, sight_id: 13)
Waypoint.create(route_id: 2, sight_id: 14)
Waypoint.create(route_id: 2, sight_id: 15)
Waypoint.create(route_id: 2, sight_id: 16)
Waypoint.create(route_id: 2, sight_id: 17)
Waypoint.create(route_id: 2, sight_id: 18)
# Zurich
Waypoint.create(route_id: 3, sight_id: 19)
Waypoint.create(route_id: 3, sight_id: 20)
Waypoint.create(route_id: 3, sight_id: 21)
Waypoint.create(route_id: 3, sight_id: 22)


puts "SEEDING COMPLETED"


# Notes and archive

# sights << Sight.create(name: "Grossmünster", description: "Das Grossmünster ist eine evangelisch-reformierte Kirche in der Altstadt von Zürich. Die Kirchenpatrone sind Felix und Regula sowie Exuperantius. Bis zur Reformation war das Grossmünster zugleich Teil eines weltlichen Chorherrenstifts und Pfarrkirche. Das Grossmünster gehört zusammen mit dem Fraumünster und der St. Peter-Kirche zu den bekanntesten Kirchen der Stadt Zürich.", latitude: 47.370093, longitude: 8.544054, place_id: "X", formatted_address: "Grossmünsterplatz, 8001 Zürich, Schweiz", picture_url:"https://i1.wp.com/magic-places.ch/wp-content/uploads/2013/09/Das-Zurcher-Grossmunster-bei-Nacht.jpg?ssl=1")
# sights << Sight.create(name: "Framünster", description: "Das Kloster Fraumünster war ein Benediktinerinnen-Stift in Zürich (Kanton Zürich, Schweiz). Die ehemalige Klosterkirche ist eines der Wahrzeichen und eine der vier Altstadtkirchen Zürichs. ", latitude: 47.37, longitude: 8.544167, place_id: "Y", formatted_address: "Münsterhof 2, 8001 Zürich, Schweiz", picture_url:"https://upload.wikimedia.org/wikipedia/commons/b/ba/Z%C3%BCrich_-_Stadthaus_-_Fraum%C3%BCnster_-_Sicht_vom_Grossm%C3%BCnster_Karlsturm_IMG_6396.JPG")
# sights << Sight.create(name: "Paradeplatz", description: "Der Paradeplatz ist ein Platz an der Bahnhofstrasse im Quartier City in Zürich. Er liegt an einer der teuersten Lagen der Stadt und ist seit Jahren ein Synonym für Banken und den Schweizer Wohlstand. Direkt am Paradeplatz befinden sich unter anderem die beiden Schweizer Grossbanken UBS und Credit Suisse. In der näheren Umgebung sind zudem eine ganze Reihe weiterer Banken beheimatet. ", latitude: 50.9105494, longitude: 9.2346855, place_id: "Z", formatted_address: "Paradeplatz, 8001 Zürich, Schweiz", picture_url:"https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Paradeplatz_2011-08-01_16-36-10_ShiftN.jpg/1920px-Paradeplatz_2011-08-01_16-36-10_ShiftN.jpg")
# sights << Sight.create(name: "Bellevueplatz", description: "Das Bellevue ist ein weitläufiger, zentraler Platz im Herzen von Zürich und ein wichtiger städtischer Verkehrsknotenpunkt. Er liegt am Südende der Altstadt an der rechten Seite des Abflusses des Zürichsees in die Limmat. ", latitude: ‎47.3670897, longitude: 8.5450858, place_id: "ZX", formatted_address: "Bellevueplatz, 8001 Zürich, Schweiz", picture_url:"https://upload.wikimedia.org/wikipedia/commons/2/2a/Bellevue_%28Z%C3%BCrich%29_-_Theaterstrasse_2013-04-15_13-17-17.JPG")
