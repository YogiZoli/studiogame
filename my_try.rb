def print_formatted_name(file="")
	@players.sort.each do |player|
		formatted_name = player.name.ljust(20, '.')
		if file == ""
			puts "#{formatted_name} #{player.score}"
		else
			file.puts "#{formatted_name} #{player.score}"
		end 
	end
end

# instead of this
	def load_players(loaded_file)
		File.readlines(loaded_file).each do |line|
			name, health = line.split(',')
			player = Player.new(name, Integer(health))
			add_player(player)
		end
	end

# I would go this way

	def add_plyer_from_array(loaded_file_in_array)
		loaded_file_in_array.each do |name, health|
			if health != /^\d+$/ { health.to_i! }
			player = Player.new(name,health)
			add_player(player)
		end
	end

	def load_files_lines_to_array(loaded_file)
		File.readlines(loaded_file).each do |line|
			name, health = line.split(',')
		end
	end

#in studio_play.rb change to:
knuckleheads.add_plyer_from_array(load_files_lines_to_array((ARGV.shift || "players.csv")))

# 1. mi a különbség mixin és modle közt?
# 2, hogy állapitod meg hogy hol lett include olva egy egy mixin vagy module
# 3. milyen hibát dob ha csak reader és nem accessor
# 4.
# 5. hogyan teszteled azt hogy valami include olva e van és kacsa e?