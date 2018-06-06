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
users << User.create(first_name: "Simon", username: "@simon", password: 123456, email: "simon@city-hikes.com", remote_picture_url_url: "http://res.cloudinary.com/dmatmwg2i/image/upload/v1527786840/qtsanl4o6xmgzdg6nxhi.jpg")

# Other users
# 05 User
users << User.create(first_name: "Zoey", username: "@zoey", password: 123456, email: "zoey@city-hikes-user.com", remote_picture_url_url: "https://randomuser.me/api/portraits/women/95.jpg")
# 06 User
users << User.create(first_name: "Anna", username: "@anna", password: 123456, email: "anna@city-hikes-user.com", remote_picture_url_url: "https://randomuser.me/api/portraits/women/29.jpg")
# 07 User
users << User.create(first_name: "Monica", username: "@monica", password: 123456, email: "monica@city-hikes-user.com", remote_picture_url_url: "https://randomuser.me/api/portraits/women/61.jpg")
# 08 User
users << User.create(first_name: "John", username: "@john", password: 123456, email: "john@city-hikes-user.com", remote_picture_url_url: "https://randomuser.me/api/portraits/men/7.jpg")

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
# 23 Sight - Berlin
Sight.create(name: "U-Bahnhof Kurfürstendamm", description: nil, latitude: 52.5034297, longitude: 13.3308759, place_id: "ChIJuywrwv5QqEcRAtmMnjiQ3go", url: "https://maps.google.com/?cid=783221958061644034", website: "http://www.bvg.de/", formatted_address: "Kurfürstendamm 18, 10719 Berlin, Deutschland")
# 24 Sight - Berlin
Sight.create(name: "Kaufhaus des Westens", description: nil, latitude: 52.5016021, longitude: 13.340993, place_id: "ChIJYb9yIlRQqEcR7A7Zwwy7q-0", url: "https://maps.google.com/?cid=17125987671506226924", website: "http://www.kadewe.de/", formatted_address: "Tauentzienstraße 21-24, 10789 Berlin, Deutschland")
# 25 Sight - Berlin
Sight.create(name: "Lützowplatz", description: nil, latitude: 52.5049577, longitude: 13.3517555, place_id: "ChIJ0ed9p1JQqEcR9o9tj4yuBD0", url: "https://maps.google.com/?q=L%C3%BCtzowpl.,+10785+Berlin,+Deutschland&ftid=0x47a85052a77de7d1:0x3d04ae8c8f6d8ff6", website: "undefined", formatted_address: "Lützowpl., 10785 Berlin, Deutschland")
# 26 Sight - Berlin
Sight.create(name: "Berliner Philharmonie", description: nil, latitude: 52.5100319, longitude: 13.369693, place_id: "ChIJK_QFBbZRqEcRZgBlwtwfnv0", url: "https://maps.google.com/?cid=18275079370930716774", website: "http://www.berliner-philharmoniker.de/", formatted_address: "Herbert-von-Karajan-Straße 1, 10785 Berlin, Deutschland")
# 27 Sight - Berlin
Sight.create(name: "Potsdamer Platz", description: nil, latitude: 52.5096488, longitude: 13.3759441, place_id: "ChIJIeqReMlRqEcRquFNJTyYoUw", url: "https://maps.google.com/?cid=5521862002224259498", website: "http://potsdamerplatz.de/", formatted_address: "Potsdamer Platz, 10785 Berlin, Deutschland")
# 28 Sight - Berlin
Sight.create(name: "Topographie des Terrors", description: nil, latitude: 52.5066836, longitude: 13.3837024, place_id: "ChIJx3iXOMxRqEcRSGbJBczVSzc", url: "https://maps.google.com/?cid=3984513367586465352", website: "http://www.topographie.de/", formatted_address: "Niederkirchnerstraße 8, 10963 Berlin, Deutschland")
# 29 Sight - Berlin
Sight.create(name: "Checkpoint Charlie", description: nil, latitude: 52.5074434, longitude: 13.3903913, place_id: "ChIJzdgmXNFRqEcRyIl9R0IApSM", url: "https://maps.google.com/?cid=2568459447151987144", website: "http://www.berlin.de/sehenswuerdigkeiten/3560059-3558930-checkpoint-charlie.html", formatted_address: "Friedrichstraße 43-45, 10117 Berlin, Deutschland")
# 30 Sight - Berlin
Sight.create(name: "Gendarmenmarkt", description: nil, latitude: 52.5137224, longitude: 13.3926698, place_id: "ChIJ4ZsybtpRqEcRkDdXJvRC7Wk", url: "https://maps.google.com/?cid=7632830559845562256", website: "http://www.berlin.de/sehenswuerdigkeiten/3560277-3558930-gendarmenmarkt.html", formatted_address: "Gendarmenmarkt, 10117 Berlin, Deutschland")
# 31 Sight - Berlin
Sight.create(name: "Alexanderplatz", description: nil, latitude: 52.5223199, longitude: 13.4130839, place_id: "ChIJbygR2x5OqEcRbhbkZsMB_DA", url: "https://maps.google.com/?cid=3529698146708100718", website: "http://www.berlin.de/orte/sehenswuerdigkeiten/alexanderplatz/index.en.php", formatted_address: "10178 Berlin, Deutschland")
# 32 Sight - Berlin
Sight.create(name: "Rotes Rathaus", description: nil, latitude: 52.5182775, longitude: 13.4086443,  place_id: "ChIJ-wu_VyBOqEcREIpNwwVGbM8", url: "https://maps.google.com/?q=Rathausstra%C3%9Fe+15,+10178+Berlin,+Deutschland&ftid=0x47a84e2057bf0bfb:0xcf6c4605c34d8a10", website: "undefined", formatted_address: "Rathausstraße 15, 10178 Berlin, Deutschland")
# 33 Sight - Berlin
Sight.create(name: "DDR Museum", description: nil, latitude: 52.5196077, longitude: 13.4027331, place_id: "ChIJVzpGU95RqEcRZJgnyr-ZDC0", url: "https://maps.google.com/?cid=3246138480436680804", website: "http://www.ddr-museum.de/", formatted_address: "Karl-Liebknecht-Str. 1, 10178 Berlin, Deutschland")
# 34 Sight - Berlin
Sight.create(name: "Berliner Dom", description: nil, latitude: 52.5190608, longitude: 13.401078, place_id: "ChIJS9HC895RqEcR_IovsNVoDng", url: "https://maps.google.com/?cid=8650967201218530044", website: "http://www.berlinerdom.de/", formatted_address: "Am Lustgarten, 10178 Berlin, Deutschland")
# 35 Sight - Berlin
Sight.create(name: "Humboldt-Universität zu Berlin", description: nil, latitude: 52.517883, longitude: 13.3936551, place_id: "ChIJI0K8KtZNqEcRxSbyV3Fx5Kk", url: "https://maps.google.com/?cid=12242034418720581317", website: "http://www.hu-berlin.de/", formatted_address: "Unter den Linden 6, 10099 Berlin, Deutschland")
# 36
Sight.create(name: "Brandenburger Tor", description: nil, latitude: 52.5162746, longitude: 13.3777041, place_id: "ChIJQyqpKMRRqEcRR_uYQXL9THg", url: "https://maps.google.com/?cid=8668582049950006087", website: "undefined", formatted_address: "10117 Berlin, Deutschland")
# 37 Sight - Berlin
Sight.create(name: "Reichstag/Bundestag (Berlin)", description: nil, latitude: 52.5186202, longitude: 13.3761872, place_id: "ChIJ3ZW8FcdRqEcR_Sr2-JA2adA", url: "https://maps.google.com/?cid=15017594428723702525", website: "undefined", formatted_address: "10557 Berlin, Deutschland")
# 38 Sight - Berlin
Sight.create(name: "Washingtonplatz/Hauptbahnhof (Berlin)", description: nil, latitude: 52.5237268, longitude: 13.3705458, place_id: "ChIJJ1TEEr5RqEcRcksOsreSXZc", url: "https://maps.google.com/?cid=10907035190225161074", website: "undefined", formatted_address: "10557 Berlin, Deutschland")
# 39 Sight - Berlin
Sight.create(name: "Schloss Bellevue (Berlin)", description: nil, latitude: 52.5175726, longitude: 13.3527928, place_id: "ChIJsV82gqVRqEcRlcNO0FcZ31w", url: "https://maps.google.com/?cid=6692095436243518357", website: "undefined", formatted_address: "10557 Berlin, Deutschland")
# 40 Sight - Berlin
Sight.create(name: "Siegessäule", description: nil, latitude: 52.5145434, longitude: 13.3501189, place_id: "ChIJgQruLq9RqEcRwS0DyIYw7V0", url: "https://maps.google.com/?q=Tiergarten,+10557+Berlin,+Deutschland&ftid=0x47a851af2eee0a81:0x5ded3086c8032dc1", website: "undefined", formatted_address: "Tiergarten, 10557 Berlin, Deutschland")
# 41 Sight - Berlin
Sight.create(name: "Zoologischer Garten Berlin", description: nil, latitude: 52.5079196, longitude: 13.3377547, place_id: "ChIJaW_IvapRqEcRfq6A6TrrOYE", url: "https://maps.google.com/?cid=9311732342823366270", website: "http://www.zoo-berlin.de/", formatted_address: "Hardenbergplatz 8, 10787 Berlin, Deutschland")
# 42 Sight - Berlin
Sight.create(name: "Alexanderplatz", description: nil, latitude: 52.5223199, longitude: 13.4130839, place_id: "ChIJbygR2x5OqEcRbhbkZsMB_DA", url: "https://maps.google.com/?cid=3529698146708100718", website: "http://www.berlin.de/orte/sehenswuerdigkeiten/alexanderplatz/index.en.php", formatted_address: "10178 Berlin, Deutschland")
# 43 Sight - Berlin
Sight.create(name: "East Side Gallery (Berlin)", description: nil, latitude: 52.5050224, longitude: 13.4396952, place_id: "ChIJFfh5Uk9OqEcRYwaaBlQDbzg", url: "https://maps.google.com/?cid=4066472647961740899", website: "undefined", formatted_address: "10243 Berlin, Deutschland")
# 44 Sight - Berlin
Sight.create(name: "Oberbaumbrücke", description: nil, latitude: 52.5018599, longitude: 13.4457079, place_id: "ChIJJzobwFFOqEcRupHEhZTPsh8", url: "https://maps.google.com/?q=Oberbaumbr%C3%BCcke,+10243+Berlin,+Deutschland&ftid=0x47a84e51c01b3a27:0x1fb2cf9485c491ba", website: "undefined", formatted_address: "Oberbaumbrücke, 10243 Berlin, Deutschland")
# 45 Sight - Berlin
Sight.create(name: "Computerspielemuseum", description: nil, latitude: 52.5174859, longitude: 13.4420031, place_id: "ChIJOZPNDGpOqEcRLlzWO_iQ5oM", url: "https://maps.google.com/?cid=9504443459442203694", website: "http://www.computerspielemuseum.de/", formatted_address: "Karl-Marx-Allee 93A, 10243 Berlin, Deutschland")
# 46 Sight - Berlin
Sight.create(name: "Mauerpark", description: nil, latitude: 52.5424, longitude: 13.403352, place_id: "ChIJd-d5Rx1SqEcRgCz33OsCSZQ", url: "https://maps.google.com/?cid=10685074802960968832", website: "http://www.mauerpark.info/", formatted_address: "Gleimstraße 55, 10437 Berlin, Deutschland")
# 47 Sight - Berlin
Sight.create(name: "Berliner Unterwelten e.V.", description: nil, latitude: 52.5477832, longitude: 13.3889551, place_id: "ChIJT0u41SFSqEcRoksggYtajcA", url: "https://maps.google.com/?cid=13874845582211697570", website: "https://berliner-unterwelten.de/", formatted_address: "Brunnenstraße 105, 13355 Berlin, Deutschland")
# 48 Sight - Berlin
Sight.create(name: "Gedenkstätte Berliner Mauer (Berlin)", description: nil, latitude: 52.5350521, longitude: 13.3901898, place_id: "ChIJ2wLzJvJRqEcRRwUpCxzRw8o", url: "https://maps.google.com/?cid=14610751534496548167", website: "undefined", formatted_address: "13355 Berlin, Deutschland")
# 49 Sight - Berlin
Sight.create(name: "Stiftung Neue Synagoge Berlin - Centrum Judaicum", description: nil, latitude: 52.5249168, longitude: 13.3941787, place_id: "ChIJO6sqyedRqEcRnszYhLdgew0", url: "https://maps.google.com/?cid=971476485952556190", website: "http://www.centrumjudaicum.de/", formatted_address: "Oranienburger Str. 28-30, 10117 Berlin, Deutschland")
# 50 Sight - Berlin
Sight.create(name: "Hackescher Markt", description: nil, latitude: 52.5231669, longitude: 13.4027254, place_id: "ChIJizVU3eBRqEcRXffbhHrtcPQ", url: "https://maps.google.com/?cid=17613839253116811101", website: "http://www.hackeschermarktberlin.de/", formatted_address: "Hackescher Markt, 10178 Berlin, Deutschland")
# 51 Sight - Berlin
Sight.create(name: "Museumsinsel", description: nil, latitude: 52.5169328, longitude: 13.4018997, place_id: "ChIJx8qLPN9RqEcRB2gSnmw5bJM", url: "https://maps.google.com/?q=Museumsinsel&ftid=0x47a851df3c8bcac7:0x936c396c9e126807", website: "undefined", formatted_address: "Museumsinsel, Berlin, Deutschland")
# 52 Sight - Basel
Sight.create(name: "Messeplatz", description: nil, latitude: 47.5641988, longitude: 7.6012624, place_id: "ChIJl3N1mLm5kUcRPAfsHAfxa-o", url: "https://maps.google.com/?q=Messepl.,+4058+Basel,+Schweiz&ftid=0x4791b9b998757397:0xea6bf1071cec073c", website: "undefined", formatted_address: "Messepl., 4058 Basel, Schweiz")
# 53 Sight - Basel
Sight.create(name: "Rathaus Basel-Stadt", description: nil, latitude: 47.558214, longitude: 7.5882969, place_id: "ChIJ51SpiK65kUcRxZ7mx38UAeY", url: "https://maps.google.com/?cid=16573550642747317957", website: "http://www.bs.ch/", formatted_address: "Marktpl. 9, 4001 Basel, Schweiz")
# 54 Sight - Basel
Sight.create(name: "Basler Münster", description: nil, latitude: 47.5564619, longitude: 7.5924433, place_id: "ChIJFfY3F7K5kUcRBLOR8yiVdoQ", url: "https://maps.google.com/?q=4051+Basel,+Schweiz&ftid=0x4791b9b21737f615:0x84769528f391b304", website: "undefined", formatted_address: "4051 Basel, Schweiz")
# 55 Sight - Basel
Sight.create(name: "Barfüsserplatz", description: nil, latitude: 47.5547904, longitude: 7.5893222, place_id: "ChIJ2d8Eda25kUcRAY_QVFveWUw", url: "https://maps.google.com/?q=Barf%C3%BCsserpl.,+Basel,+Schweiz&ftid=0x4791b9ad7504dfd9:0x4c59de5b54d08f01", website: "undefined", formatted_address: "Barfüsserpl., Basel, Schweiz")
# 56 Sight - Basel
Sight.create(name: "Tinguely Brunnen", description: nil, latitude: 47.5536929, longitude: 7.5906116, place_id: "ChIJq_FIbq25kUcRN7BLbnUILUY", url: "https://maps.google.com/?cid=5056707257061584951", website: "https://www.basel.com/de/Media/Attraktionen/Sehenswuerdigkeiten/Tinguely-Brunnen", formatted_address: "Klostergasse 7, 4051 Basel, Schweiz")
# 57 Sight - Basel
Sight.create(name: "Kunstmuseum", description: nil, latitude: 47.5540319, longitude: 7.5941927, place_id: "ChIJlSWhqbO5kUcR9L7iGbS--_w", url: "https://maps.google.com/?cid=18229373597449895668", website: "undefined", formatted_address: "4051 Basel, Schweiz")
# 58 Sight - Basel
Sight.create(name: "Fähribödeli", description: nil, latitude: 47.5567677, longitude: 7.593131, place_id: "ChIJUashJLK5kUcRofmf8rnEcao", url: "https://maps.google.com/?q=F%C3%A4hrib%C3%B6deli,+4051+Basel,+Schweiz&ftid=0x4791b9b22421ab51:0xaa71c4b9f29ff9a1", website: "undefined", formatted_address: "Fähribödeli, 4051 Basel, Schweiz")

### ROUTES ###
puts "Generating routes ..."

# Munich 01
Route.create(name: "Beautiful Munich in one afternoon", time: 132, distance: 9.9, no_exports: 42, avg_rating: 4.5, description: "Munich, Bavaria’s capital, is home to centuries-old buildings and numerous museums. The city is known for its annual Oktoberfest celebration and its beer halls, including the famed Hofbräuhaus, founded in 1589. In the Altstadt (Old Town), central Marienplatz square contains landmarks such as Neo-Gothic Neues Rathaus (town hall), with a popular glockenspiel show that chimes and reenacts stories from the 16th century.", public: true, user_id: 1, city_id: 2)
# London 02
Route.create(name: "The City", time: 122, distance: 9.5, no_exports: 38, avg_rating: 4.0, description: "London, the capital of England and the United Kingdom, is a 21st-century city with history stretching back to Roman times. At its centre stand the imposing Houses of Parliament, the iconic ‘Big Ben’ clock tower and Westminster Abbey, site of British monarch coronations. Across the Thames River, the London Eye observation wheel provides panoramic views of the South Bank cultural complex, and the entire city.", public: true, user_id: 4, city_id: 4)
# Zurich 03
Route.create(name: "Picturesque Zurich", time: 15, distance: 1.1, no_exports: 23, avg_rating: 0.0, description: "The city of Zurich, a global center for banking and finance, lies at the north end of Lake Zurich in northern Switzerland. The picturesque lanes of the central Altstadt (Old Town), on either side of the Limmat River, reflect its pre-medieval history. Waterfront promenades like the Limmatquai follow the river toward the 17th-century Rathaus (town hall).", public: true, user_id: 2, city_id: 7)
# Berlin 04
Route.create(name: "Traditional tour", time: 183, distance: 14.6, no_exports: 53, avg_rating: 4.0, description: "Most iconic sightseeing spots of Germany's capital.", public: true, user_id: 5, city_id: 1)
# Berlin 05
Route.create(name: "Historic Berlin and 'Kietz' Tour", time: 201, distance: 16.1, no_exports: 45, avg_rating: 5.0, description: "Historic sites such like the East Side Galery and truely Berlin places like the Mauerpark", public: true, user_id: 1, city_id: 1)
# Basel 06
Route.create(name: "Tour through Basel", time: 50, distance: 3.8, no_exports: 14, avg_rating: 4.33, description: "Basel is a city on the Rhine River in northwest Switzerland, close to the country’s borders with France and Germany. Its medieval old town centers around Marktplatz, dominated by the 16th-century, red-sandstone Town Hall. Its 12th-century Gothic cathedral has city views, and contains the tomb of the 16th-century Dutch scholar, Erasmus. The city’s university houses some of Erasmus’ works.", public: true, user_id: 7, city_id: 10)
# Barcelona 07
# missing


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

# Berlin 04
RoutePicture.create(route_id: 4, remote_route_picture_url: "https://res.cloudinary.com/dmatmwg2i/image/upload/v1528296963/qjz1hrrlpkyuuyrbmvkk.jpg") # Brandenburger Tor
RoutePicture.create(route_id: 4, remote_route_picture_url: "https://res.cloudinary.com/dmatmwg2i/image/upload/v1528290779/d72uxipa5dq9buretsdc.png") # Reichstag
RoutePicture.create(route_id: 4, remote_route_picture_url: "https://res.cloudinary.com/dmatmwg2i/image/upload/v1528290769/uoxyo9jdm4vxrtenywjd.jpg") # Blick auf Museumsinsel von Friedrichstr.
RoutePicture.create(route_id: 4, remote_route_picture_url: "https://res.cloudinary.com/dmatmwg2i/image/upload/v1528290775/tprqbxdjvhkxljpaqw5j.jpg") # Berliner Dom

# Berlin 05
RoutePicture.create(route_id: 5, remote_route_picture_url: "https://res.cloudinary.com/dmatmwg2i/image/upload/v1528290567/nhjn5xxryd1jbtnl5euo.jpg") # East Side Gallery
RoutePicture.create(route_id: 5, remote_route_picture_url: "https://res.cloudinary.com/dmatmwg2i/image/upload/v1528290574/ro7zychmphigyoavooc1.jpg") # Mauerpark
RoutePicture.create(route_id: 5, remote_route_picture_url: "https://res.cloudinary.com/dmatmwg2i/image/upload/v1528290565/avmwx8uzvneku7ouof1y.jpg") # Berghain
RoutePicture.create(route_id: 5, remote_route_picture_url: "https://res.cloudinary.com/dmatmwg2i/image/upload/v1528290576/clx2ht3ygiyjnhgzrq2f.jpg") # East Side Gallery Art
RoutePicture.create(route_id: 5, remote_route_picture_url: "https://res.cloudinary.com/dmatmwg2i/image/upload/v1528290560/sfr5xtyval6zqjgcrkn6.jpg") # Oberbaumbruecke

# Basel 06
RoutePicture.create(route_id: 6, remote_route_picture_url: "https://res.cloudinary.com/dmatmwg2i/image/upload/v1528290593/m8brltlbgtehyvpd2xbu.jpg")
RoutePicture.create(route_id: 6, remote_route_picture_url: "https://res.cloudinary.com/dmatmwg2i/image/upload/v1528318457/c5mw2cpwrxwz6utv6jzh.jpg")
RoutePicture.create(route_id: 6, remote_route_picture_url: "https://res.cloudinary.com/dmatmwg2i/image/upload/v1528318455/rh2ssdaug5wuzzqix8dl.jpg")

# Barcelona 07
# missing


### WAYPOINTS ###
puts "Generating waypoints ..."

# Munich 01
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
# London 02
Waypoint.create(route_id: 2, sight_id: 13)
Waypoint.create(route_id: 2, sight_id: 14)
Waypoint.create(route_id: 2, sight_id: 15)
Waypoint.create(route_id: 2, sight_id: 16)
Waypoint.create(route_id: 2, sight_id: 17)
Waypoint.create(route_id: 2, sight_id: 18)
# Zurich 03
Waypoint.create(route_id: 3, sight_id: 19)
Waypoint.create(route_id: 3, sight_id: 20)
Waypoint.create(route_id: 3, sight_id: 21)
Waypoint.create(route_id: 3, sight_id: 22)
# Berlin 04
Waypoint.create(route_id: 4, sight_id: 23)
Waypoint.create(route_id: 4, sight_id: 24)
Waypoint.create(route_id: 4, sight_id: 25)
Waypoint.create(route_id: 4, sight_id: 26)
Waypoint.create(route_id: 4, sight_id: 27)
Waypoint.create(route_id: 4, sight_id: 28)
Waypoint.create(route_id: 4, sight_id: 29)
Waypoint.create(route_id: 4, sight_id: 30)
Waypoint.create(route_id: 4, sight_id: 31)
Waypoint.create(route_id: 4, sight_id: 32)
Waypoint.create(route_id: 4, sight_id: 33)
Waypoint.create(route_id: 4, sight_id: 34)
Waypoint.create(route_id: 4, sight_id: 35)
Waypoint.create(route_id: 4, sight_id: 36)
Waypoint.create(route_id: 4, sight_id: 37)
Waypoint.create(route_id: 4, sight_id: 38)
Waypoint.create(route_id: 4, sight_id: 39)
Waypoint.create(route_id: 4, sight_id: 40)
Waypoint.create(route_id: 4, sight_id: 41)
# Berlin 05
Waypoint.create(route_id: 5, sight_id: 42)
Waypoint.create(route_id: 5, sight_id: 43)
Waypoint.create(route_id: 5, sight_id: 44)
Waypoint.create(route_id: 5, sight_id: 45)
Waypoint.create(route_id: 5, sight_id: 46)
Waypoint.create(route_id: 5, sight_id: 47)
Waypoint.create(route_id: 5, sight_id: 48)
Waypoint.create(route_id: 5, sight_id: 49)
Waypoint.create(route_id: 5, sight_id: 50)
Waypoint.create(route_id: 5, sight_id: 51)
# Basel 06
Waypoint.create(route_id: 6, sight_id: 52)
Waypoint.create(route_id: 6, sight_id: 53)
Waypoint.create(route_id: 6, sight_id: 54)
Waypoint.create(route_id: 6, sight_id: 55)
Waypoint.create(route_id: 6, sight_id: 56)
Waypoint.create(route_id: 6, sight_id: 57)
Waypoint.create(route_id: 6, sight_id: 58)

### REVIEWS ###

puts "Generating reviews ..."

# Munich 01
Review.create(user_id: 8, content: "Indeed a great route for my home town.", rating: 5, route_id: 1)
Review.create(user_id: 3, content: "A bit short but besides that nice.", rating: 4, route_id: 1)
# London 02
Review.create(user_id: 2, content: "Too touristic in my opinion.", rating: 3, route_id: 2)
Review.create(user_id: 1, content: "Loved Covent Garden.", rating: 5, route_id: 2)
# Zurich 03
# Berlin 04
Review.create(user_id: 7, content: "Great tour!", rating: 5, route_id: 4)
Review.create(user_id: 6, content: "Too much walking.", rating: 3, route_id: 4)
# Berlin 05
Review.create(user_id: 7, content: "Enjoyed to see the less touristic spots.", rating: 5, route_id: 5)
# Basel 06
Review.create(user_id: 5, content: "Thanks for that nice tour, really enjoyed it", rating: 5, route_id: 6)
Review.create(user_id: 8, content: "Liked it, but Tinguely Museum is missing", rating: 4, route_id: 6)
Review.create(user_id: 6, content: "Definitively a good route.", rating: 4, route_id: 6)


### COMPLETED ###

puts "SEEDING COMPLETED"
