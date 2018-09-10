require 'pp'
require 'csv'
require 'ostruct'
require 'date'

HEADERS = %i[link name year country date genre duration rating author actors].freeze

films = CSV.foreach('./data/movies.txt', headers: HEADERS, col_sep: "|").map { |row| OpenStruct.new(row.to_h) }

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

comedy = films.select { |value| value[:genre].include?('Comedy')}.sort_by(&:date)
print_result(comedy)

puts "================================================="

films.map(&:author).sort_by { |name| name.split(" ").last }.uniq.each { |name| puts name }

puts "================================================="

movies_shot_not_us = films.count { |value| value[:country] != 'USA' }
puts movies_shot_not_us

puts "================================================="

dates = films.map(&:date).delete_if { |obj| obj.length < 7 }.map { |value| Date.strptime(value, "%Y-%m").mon }.group_by(&:itself)
dates.sort.each { |key, value| puts "#{Date::MONTHNAMES[key]}: #{value.count} movies" }
