require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
	
	attr_accessor :title

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player(a_player)
		@players << a_player
	end

	def play(round)
		puts "There are #{@players.size} players in #{@title}: "

		@players.each do |player|
			puts player
		end

		treasures = TreasureTrove::TREASURES
		puts "\nThere are #{treasures.size} treasures to be found:"
		treasures.each do |treasure|
			puts "A #{treasure.name} is worth #{treasure.points} points"
		end


		1.upto(round) do |round|
			puts "\n Round #{round}"
			@players.each do |player|
				GameTurn.take_turn(player)
				puts player
			end
		end
	end


	def print_name_and_health(player)
		puts "#{player.name} (#{player.health})"
	end


	def total_points
		@players.reduce(0) do |sum, player|
			sum + player.points
		end
	end

	def print_stats
		strong_players, wimpy_players = @players.partition { |player| player.strong? }

		puts "\n#{@title} Statistics:"

		puts "\n#{strong_players.size} strong players:\n"
		strong_players.each do |player|
			print_name_and_health(player)
		end

		puts "\n#{wimpy_players.size} wimpy players:\n"
		wimpy_players.each do |player|
			print_name_and_health(player)
		end

		#sorted_players = @players.sort { |a,b| b.score <=> a.score }
    puts "\n#{@title} High Scores:"

		@players.each do |player| 
			puts high_score_entry(player)
		end

		@players.each do |player| 
			puts "\nTotal points of #{player.name} = #{player.points}"
		end

		@players.sort.each do |player|
 			 puts "\n#{player.name}'s point totals:"
			 player.each_found_treasure do |treasure|
 		   	puts "#{treasure.points} total #{treasure.name} points"
			 end
			 puts "#{player.points} grand total points"
		end

		puts "\nThe total treasure points found during the game: #{total_points}"

	end
 
	def load_players(loaded_file)
		File.readlines(loaded_file).each do |line|
			add_player(Player.from_csv(line))
		end
	end

=begin
# Alternatively I can use the CSV lib from Ruby
require 'csv'
def load_players(from_file)
  CSV.foreach(from_file) do |row|
    player = Player.new(row[0], row[1].to_i)
    add_player(player)
  end
end
=end


	def high_score_entry(player)
			@players.sort.each do |player|
				formatted_name = player.name.ljust(20, '.')
				"#{formatted_name} #{player.score}"
			end
	end


	def save_high_scores(high_scores_file="high_scores.txt")
		File.open(high_scores_file, "w") do |file|
			file.puts "#{@title} High Scores:"
   		@players.sort.each do |player|
      	file.puts high_score_entry(player)
    	end
		end
	end
end