require_relative 'game'
require_relative 'die'

describe Game do 

	before do
		@game = Game.new("Knuckleheads")

		@initial_health = 100
		@player = Player.new("moe", @initial_health)

		@game.add_player(@player)
	end
	
	it "should increase health with 15 if high number is rolled" do
		Die.any_instance.stub(:roll).and_return(5)

		@game.play

		@player.health.should == @initial_health + 15
	end

	it "skips the player if a medium number is rolled" do
		Die.any_instance.stub(:roll).and_return(3)

		@game.play

		@player.health.should == @initial_health
	end

	it "should decrease health with 10 if a low number is rolled" do
		Die.any_instance.stub(:roll).and_return(1)

		@game.play

		@player.health.should == @initial_health - 10
	end
end