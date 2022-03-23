# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Artwork.destroy_all 
ArtworkShare.destroy_all
User.destroy_all

# Users
daniel = User.create!(
  username: "dan_the_man")

cathy = User.create!(
  username: "catz")

# Artworks
artwork1 = Artwork.create!(title: "music", image_url: "WWWW.1.com", artist_id: cathy.id)

artwork2 = Artwork.create!(title: "sport", image_url: "WWWW.2.com", artist_id: daniel.id)

# ArtworkShare
artworkshare1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: daniel.id)
artworkshare2 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: cathy.id)