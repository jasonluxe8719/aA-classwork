# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'stefani')
User.create(username: 'jason')
Artwork.create(artist_id: 1, title: 'Judith Slaying Holfernes', image_url: 'www.atemesiagentileschi.com')
Artwork.create(artist_id: 2, title: 'There is a devil inside me', image_url: 'www.anamendieta.com')
ArtworkShare.create(artwork_id: 1, viewer_id: 2)
ArtworkShare.create(artwork_id: 2, viewer_id: 1)






