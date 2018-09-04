HEADERS = [:link, :name, :year, :country, :date, :genre, :duration, :rating, :author, :actors].freeze

file_path = './data/movies.txt'

lines = File.readlines(file_path)
films = lines.map {|obj| HEADERS.zip(obj.split("|")).to_h}

sort = films.select { |obj| obj[:name].include?("Max") }

sort.each do |value|
  rating = ((value[:rating].to_f - 8.0)*10).to_i
  puts "#{value[:name]} #{"*" * rating}"
end
