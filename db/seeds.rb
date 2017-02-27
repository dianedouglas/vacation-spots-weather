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
user.save
Place.delete_all
Place.create!(
  user_id: user.id,
  location: 'Vancouver, B.C., Canada', 
  image_url: 'http://vancouverbcmover.com/images/richmond.jpg', 
  visit_length: '12 years', 
  favorite_memory: 
%{I loved visiting Science World to see the laser shows and the planetarium.}
)
Place.create!(
  user_id: user.id,
  location: 'Boston, MA', 
  image_url: 'https://upload.wikimedia.org/wikipedia/commons/8/86/Bostonstraight.jpg', 
  visit_length: '4 years', 
  favorite_memory: 
%{Went to college there, met my husband there, all sorts of good times. Love walking across the Mass ave. bridge.}
)