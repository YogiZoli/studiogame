require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

class Game
	def initialize(title)
		@title = title
		@players = []
	end

	attr_reader :title

	def add_player(a_player)
		@players << a_player
	end

	def play
		puts "There are #{@players.size} players in #{@title}: "
		@players.each do |player|
			puts player
		end

		@players.each do |player|
			GameTurn.take_turn(player)

			die = Die.new
			number_rolled = die.roll


			case die.roll
			when 1..2
				player.blam
			when 3..4
				puts "#{player.name} was skipped."
			else
				player.w00t
			end

			# if number_rolled < 3
			# 	player.blam
			# elsif number_rolled < 5
			# 	puts "#{player.name} was skipped."
			# else
			# 	player.w00t
			# end
		end
	end
end