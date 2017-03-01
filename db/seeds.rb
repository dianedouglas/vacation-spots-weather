# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
user = User.new(
  name: 'tester',
  password: 'secret',
  password_confirmation: 'secret'
)
user2 = User.new(
  name: 'diane',
  password: 'secret',
  password_confirmation: 'secret'
)
user.save
user2.save
Place.delete_all
Place.create!(
  user_id: user.id,
  location: 'Vancouver, B.C., Canada',
  image_url: 'http://vancouverbcmover.com/images/richmond.jpg',
  visit_length: '12 years',
  favorite_memory: "I loved visiting Science World to see the laser shows and the planetarium."
)
Place.create!(
  user_id: user.id,
  location: 'Boston, MA',
  image_url: 'https://upload.wikimedia.org/wikipedia/commons/8/86/Bostonstraight.jpg',
  visit_length: '4 years',
  favorite_memory: "Went to college there, met my husband there, all sorts of good times. Love walking across the Mass ave. bridge."
)
Place.create!(
  user_id: user.id,
  location: 'Philadelphia, PA',
  image_url: 'http://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/1446142365/philadelphia-header-dg1015.jpg?itok=ly_iKkKp',
  visit_length: '6 months',
  favorite_memory: "I currently live in Philly, and I'll never forget the first time I walked all the way from South Philly up to City Hall looking at all the interesting architecture."
)
Place.create!(
  user_id: user.id,
  location: 'Portland, OR',
  image_url: 'https://www.travelportland.com/wp-content/uploads/2013/09/whitestag2576.jpg',
  visit_length: '3 years',
  favorite_memory: "Walking around the Willamette river with my husband or going shopping and drinking cider with my best friend, Beth."
)
Place.create!(
  user_id: user2.id,
  location: '950 Indian Rock Ave, CA',
  image_url: 'https://oaklandgeology.files.wordpress.com/2010/12/indianrockbig.jpg',
  visit_length: '6 years',
  favorite_memory: "I went to highschool in Berkeley, and then moved back there after college for a few years. 
  I have always enjoyed climbing Indian Rock and looking at the view of San Francisco from there, especially watching the sunrise."
)
Place.create!(
  user_id: user2.id,
  location: 'Bryce Canyon, Utah',
  image_url: 'https://i.imgur.com/rlxiKiC.jpg',
  visit_length: '1 Week',
  favorite_memory: "Took a road trip there with my mom once, and I will never forget the first time we went hiking through there at sunset. Light hits the red rocks and the sky looks like it is on fire."
)
Place.create!(
  user_id: user2.id,
  location: 'Zion National Park, Utah',
  image_url: 'https://emiliosantiago.files.wordpress.com/2013/09/img_6065.jpg',
  visit_length: '2 Days',
  favorite_memory: "Drove through here on my way to Bryce Canyon with my mom. We listened to Pink Floyd the whole way - 'One of these Days' was a perfect fit."
)
