class Movie
  attr_reader :link, :name, :year, :country, :date, :genre, :duration, :rating, :author, :actors

  def initialize(movie = {})
    @link = movie[:link]
    @name = movie[:name]
    @year = movie[:year]
    @country = movie[:country]
    @date = movie[:date]
    @genre = movie[:genre]
    @duration = movie[:duration]
    @rating = movie[:rating]
    @author = movie[:author]
    @actors = movie[:actors]
    set_rating
  end

  def set_rating
    @rating  = "*" if @rating == "8.1"
    @rating  = "**" if @rating == "8.2"
    @rating  = "***" if @rating == "8.3"
    @rating  = "****" if @rating == "8.4"
    @rating  = "******" if @rating == "8.5"
    @rating  = "*******" if @rating == "8.6"
    @rating  = "********" if @rating == "8.7"
    @rating  = "*********" if @rating == "8.8"
    @rating  = "**********" if @rating == "8.9"
    @rating  = "***********" if @rating == "9.0"
    @rating  = "************" if @rating == "9.1"
    @rating  = "*************" if @rating == "9.2"
    @rating  = "**************" if @rating == "9.3"
  end

  def to_s
    "#{@name}: #{@rating}"
  end
end
