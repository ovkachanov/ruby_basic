class MovieCollection
  HEADERS = [:link, :name, :year, :country, :date, :genre, :duration, :rating, :author, :actors].freeze

  attr_reader :films

  def initialize(file_path)
    raise "Файл #{file_path} содержит мало строк." if File.readlines(file_path).size < 3

    lines = File.readlines(file_path)
    @films =  lines.map { |film| Movie.new(HEADERS.zip(film.split('|')).to_h) }
  end
end
