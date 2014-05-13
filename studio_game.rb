require_relative 'player'
require_relative 'game'
require_relative 'clumsy_player'
require_relative 'berserk_player'

player1 = Player.new("jokaimore", 100)
player2 = Player.new("kosztolany")
player3 = Player.new("larry", 60)
player4 = Player.new("curly", 125)
# player5 = Player.new("Alvin", 38)
# player6 = Player.new("Roshan", 113)
# player7 = Player.new("Andre", 63)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.add_player(player4)
# knuckleheads.add_player(player5)
# knuckleheads.add_player(player6)
# knuckleheads.add_player(player7)

player8 = ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(player8)

player9 = BerserkPlayer.new("berserker", 50)
knuckleheads.add_player(player9)

loop do
	puts "How many turns you wanna play? ('quit' to exit)"
	answer = gets.chomp.downcase
	
	case answer
	when /^\d+$/
		puts "Enjoy your #{answer} turns!"
		knuckleheads.play(answer.to_i)
	when 'quit', 'exit'
		knuckleheads.print_stats
		break
	else
		puts "\nPlease enter a number or 'quit'"
	end
end

knuckleheads.save_high_scores

puts "\n === Thanks for playing. Play again by pressing the UP arrow and Enter. === "