# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
List.destroy_all
Bookmark.destroy_all
Movie.destroy_all
require 'json'
require 'open-uri'
url = "https://tmdb.lewagon.com/movie/top_rated"
result = JSON.parse(URI.open(url).read)
result["results"].each do |result_1|
  Movie.create!(title: result_1["original_title"], overview: result_1["overview"], poster_url: "https://image.tmdb.org/t/p/original/#{result_1["poster_path"]}.jpg", rating:result_1["vote_average"])
end
