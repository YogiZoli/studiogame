# puts 'Mikey loved Goonies'

# puts 'Mike\'s favorite movie is Gonnies.'

# movie = 'AliG'

# puts 'Mike\'s favorite movie is ' + movie

# rank = 9

# puts movie + ' has the rank ' + rank.to_s

# ##


# puts "David loved Goonies"

# puts "David\'s favorite movie is Godfather."

# dmovie = 'Poirot'

# puts "David\'s favorite movie is #{dmovie}"

# drank = 10

# puts "#{dmovie} has the rank #{drank}"

def weekday
	current_time = Time.new
	today = current_time.strftime("%A")
end

def movie_listing(title, rank=10)
	"#{title.capitalize} has a rank or #{rank} as of #{weekday.upcase}"
end

puts movie_listing("groove", 3)
puts movie_listing("ghost", 7)

a_title = "godfather"
a_rank = 10

puts movie_listing(a_title)