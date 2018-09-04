movie = ARGV[0].to_s

bad_movie = "Titanic is a bad movie"
good_movie = "Matrix is a good movie"

if movie == "Matrix"
  puts good_movie
elsif movie == "Titanic"
  puts bad_movie
else
  puts "Haven't seen #{movie} yet"
end


movie = ARGV[0].to_s

bad_movie = ["Branded", "BloodRayne", "Minotaur"]
good_movie = ["Leon", "Inception", "Intouchables"]

bad_characteristic = "#{movie} is a bad movie"
good_characteristic = "#{movie} is a good movie"

if bad_movie.include?(movie)
  puts bad_characteristic
elsif good_movie.include?(movie)
  puts good_characteristic
else
  puts "Haven't seen #{movie} yet"
end
