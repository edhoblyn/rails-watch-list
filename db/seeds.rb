# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database up..."

Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

puts "Creating movies"

10.times do
  Movie.create!(
  title: Faker::Movie.unique.title,
  overview: Faker::Lorem.paragraph(sentence_count: 3),
  poster_url: Faker::LoremFlickr.image(size: "400x600", search_terms: [ 'movie' ]),
  rating: rand(5.0..9.9).round(1)
  )
end

puts "Done!!"
