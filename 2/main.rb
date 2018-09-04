require_relative "lib/movie"
require_relative "lib/movie_collection"

file_path = ARGV[0] || './data/movies.txt'

movies = MovieCollection.new(file_path)

unless File.exist?(file_path)
  puts "Файлы не найдены в #{file_path}"
  exit
end

puts movies.films.select { |obj| obj.name.include?("Max") }
