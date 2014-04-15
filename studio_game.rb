require_relative 'game'

player1 = Player.new("jokaimore", 100)
player2 = Player.new("kosztolany")
player3 = Player.new("larry", 60)
player4 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.add_player(player4)
knuckleheads.play

player5 = Player.new("Alvin", 38)
player6 = Player.new("Roshan", 113)
player7 = Player.new("Andre", 63)

chipmunks = Game.new("Chipmunks")
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.add_player(player7)
chipmunks.play