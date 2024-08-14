# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
 require 'rest-client'
# require 'faker'
# puts "Cleaning DB..."
# Movie.destroy_all

# puts 'Creating movies...'
# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# puts "Created #{Movie.all.length} movies"

# Movie.all.each do |movie|
#  puts "#{movie.title}"
# end

# generate 35 Movies
# (1..35).each do |movie|
#   Movie.create!(
#     title: Faker::Movie.title,
#     overview: Faker::Movie.quote,
#     rating: (0..10).to_f.sample,
#     poster_url: VALID_CATEGORIES.sample
#   )
# end
# url = "https://tmdb.lewagon.com/movie/top_rated"
# movie_serialized = URI.open(url).read
# movie = JSON.parse(movie_serialized)

# puts "#{movie["title"]} - #{movie["overview"]}"


# puts "Created #{Movie.length} movies"
# 1  puts "Getting Movie Data"

def movies_dataset
  movies = RestClient.get("https://tmdb.lewagon.com/movie/top_rated")
  movies_array = JSON.parse(movies)["results"]
  movies_array.each do |g|
    Movie.create(
      title: g["original_title"],
      overview: g["overview"],
      poster_url: g["poster_path"],
      rating: g["vote_average"]
    )
  end
end
 movies_dataset()
 puts "Seeding Games Data"
    puts "Created #{Movie.count} movies"
