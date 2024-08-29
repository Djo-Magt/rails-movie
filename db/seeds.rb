require "json"
require "open-uri"

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

url = "https://tmdb.lewagon.com/movie/top_rated"



10.times do |i|
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)["results"]
    movies.each do |movie|
      base_poster_url = "https://image.tmdb.org/t/p/original"
      Movie.create(
        title: movie["title"],
        resume: movie["overview"],
        rating: movie["vote_average"],
        poster_url: "#{base_poster_url}#{movie["backdrop_path"]}",
      )
    end
end

puts "#{Movie.count}"
