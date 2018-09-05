require "pp"
HEADERS = %i[link name year country date genre duration rating author actors].freeze

file_path = './data/movies.txt'

lines = File.readlines(file_path)
films = lines.map { |obj| HEADERS.zip(obj.split('|')).to_h }
sort = films.select { |obj| obj[:name].include?('Max') }

def print_result(obj)
  obj.each { |value| puts "#{value[:name]} (#{value[:date]}; #{value[:genre]}) - #{value[:duration]}" }
end

puts "================================================="

sort.each do |value|
  rating = ((value[:rating].to_f - 8.0)*10).to_i
  puts "#{value[:name]} #{"*" * rating}"
end

puts "================================================="

the_longests = films.sort_by { |film| film[:duration].to_i }.reverse.take(5)
print_result(the_longests)

puts "================================================="

comedy = films.select { |value| value[:genre].include?('Comedy')}.sort_by{ |value| value[:date] }
print_result(comedy)

puts "================================================="

films.map { |value| value[:author] }.sort_by { |name| name.split(" ").last }.uniq.each { |name| puts name }

puts "================================================="

movies_shot_not_us = films.count { |value| value[:country] != 'USA' }
puts movies_shot_not_us
