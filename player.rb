class Player
	attr_reader :health
	attr_accessor :name

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health
	end

	def name=(new_name)
		@name = new_name.capitalize
	end

	def to_s
		"I\'m #{@name} with a health of #{@health} and a score of #{score}"
	end

	def blam
		@health -= 10
		puts "#{@name} got blammed!"
	end

	def w00t
		@health += 15
		puts "#{@name} got w00ted!"
	end

	def score
		@name.length + @health
	end
end

if __FILE__ == $0

	puts "now we are running player.rb"


	player1 = Player.new("jokaimore", 100)
	puts player1.inspect

	player2 = Player.new("kosztolany")
	puts player2.inspect

	player3 = Player.new("larry", 60)
	puts player3.inspect

	player4 = Player.new("curly", 125)
	puts player4.inspect

	puts "\n *** *** *** \n\n\n"

	puts player1
	puts player2
	puts player3
	puts player4

	puts player4.blam
	puts player4
	puts player4.w00t
	puts player4

	puts "\n\n\n ***** PLAYERS HEALTH ***** \n\n\n"

	puts player1.health
	puts player2.health
	puts player3.health
	puts player4.health

	puts "\n Larry has a real name for Mama which is: \n "

	player4.name = "lawrence" 
	puts player4.name

	puts "\n Lets use players in an Array: \n "

	players = [player1, player2, player3, player4]

	puts "\n There are #{players.size} players in the game: \n"

	players.each do |player|
		puts player
	end

	players.each do |player|
		puts player.health
	end

	players.each do |player|
		player.w00t
		player.blam
		puts player
	end

	puts "\n\n\n ***** Player 4 has changed ***** \n\n\n"

	players.pop
	player4 = Player.new("Schemp", 90)
	players.push(player4)

	players.each do |player|
		puts player
	end
end