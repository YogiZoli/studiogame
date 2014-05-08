require_relative 'player'
require_relative 'game'

player1 = Player.new("jokaimore", 100)
player2 = Player.new("kosztolany")
player3 = Player.new("larry", 60)
player4 = Player.new("curly", 125)
player5 = Player.new("Alvin", 38)
player6 = Player.new("Roshan", 113)
player7 = Player.new("Andre", 63)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.add_player(player4)
knuckleheads.add_player(player5)
knuckleheads.add_player(player6)
knuckleheads.add_player(player7)

knuckleheads.play(1)

knuckleheads.print_stats

puts "\n === Thanks for playing. Play again by pressing the UP arrow and Enter. === "