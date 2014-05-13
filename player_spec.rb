require_relative 'player'
require_relative 'treasure_trove'

describe Player do
  	
  	before do
#  		$stdout = StringIO.new
  		@initial_health = 150
  		@player = Player.new("larry", @initial_health)
  	end

  	it { expect(@player.name).to eq "Larry" }

    it "has a capitalized name" do
    	@player.name.should == "Larry"
    end

 	it "has an initial health" do
		@player.health.should == @initial_health
 	end

	it "has a string representation" do  
	  @player.found_treasure(Treasure.new(:hammer, 50))
	  @player.found_treasure(Treasure.new(:hammer, 50))

	  #@player.to_s.should == "I'm Larry with a health of 150 and a score of 250."
	  @player.to_s.should == "I'm Larry with health = 150, points = 100, and score = 250."
	end

	it "computes a score as the sum of its health and points" do
		@player.score.should == @player.health + @player.points
	end

	it "increases health by 15 when w00ted" do
		@player.w00t 
		@player.health.should == @initial_health + 15
	end

	it "decreases health by 10 when blammed" do
		@player.blam
		@player.health.should == @initial_health - 10
	end

	context "with a health greater than 100" do
		before do
			@player = Player.new("larry", 150)
		end

		it "is strong" do
			@player.strong?.should be_true
		end
	end

	context "with a health less then 100" do
		before do
			@player = Player.new("larry", 90)
		end

		it "is wimpy" do
			@player.strong?.should_not be_true
		end
	end

	context "in a collection of players" do
	  before do
	    @player1 = Player.new("moe", 100)
	    @player2 = Player.new("larry", 200)
	    @player3 = Player.new("curly", 300)

	    @players = [@player1, @player2, @player3]
	  end
  
	  it "is sorted by decreasing score" do
	    @players.sort.should == [@player3, @player2, @player1]
	  end
    end

	it "computes a score as the sum of its health and points" do
	  @player.found_treasure(Treasure.new(:hammer, 50))
	  @player.found_treasure(Treasure.new(:hammer, 50))
	  
	  @player.score.should == 250
	end

	it "yields each found treasure and its total points" do
	  @player.found_treasure(Treasure.new(:skillet, 100))
	  @player.found_treasure(Treasure.new(:skillet, 100))
	  @player.found_treasure(Treasure.new(:hammer, 50))
	  @player.found_treasure(Treasure.new(:bottle, 5))
	  @player.found_treasure(Treasure.new(:bottle, 5))
	  @player.found_treasure(Treasure.new(:bottle, 5))
	  @player.found_treasure(Treasure.new(:bottle, 5))
	  @player.found_treasure(Treasure.new(:bottle, 5))
	  
	  yielded = []
	  @player.each_found_treasure do |treasure|
	    yielded << treasure
	  end
	  
	  yielded.should == [
	    Treasure.new(:skillet, 200), 
	    Treasure.new(:hammer, 50), 
	    Treasure.new(:bottle, 25)
	 ]
	end

	it "can be created from a CSV string" do  
  		player = Player.from_csv("larry,150")

		player.name.should == "Larry"
  		player.health.should == 150
	end

end