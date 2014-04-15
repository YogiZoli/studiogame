require_relative 'player'

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
		puts @players
		@players.each do |pl|
			pl.blam
			pl.w00t
			pl.w00t
			puts pl
		end
	end
end