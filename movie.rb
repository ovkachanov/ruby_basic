HEADERS = [:link, :name, :year, :country, :date, :genre, :duration, :rating, :author, :actors].freeze

file_path = './data/movies.txt'

lines = File.readlines(file_path)
films = lines.map { |obj| HEADERS.zip(obj.split('|')).to_h }
sort = films.select { |obj| obj[:name].include?('Max') }

puts "================================================="

sort.each do |value|
  rating = ((value[:rating].to_f - 8.0)*10).to_i
  puts "#{value[:name]} #{"*" * rating}"
end

puts "================================================="

the_longests = films.sort_by { |film| film[:duration].to_i }.reverse.take(5)
the_longests.each { |value| puts "#{value[:name]} #{value[:duration]}" }

puts "================================================="

comedy = films.select { |value| value[:genre].include?('Comedy')}.sort_by{ |value| value[:date] }
comedy.each { |value| puts "#{value[:name]} Release date: #{value[:date]}" }

puts "================================================="

authors = films.sort_by { |value| value[:author] }.uniq { |value| value[:author] }
authors.each { |value| puts value[:author] }

puts "================================================="

movies_shot_not_us = films.select { |value| value[:country] != 'USA' }
puts movies_shot_not_us.count
