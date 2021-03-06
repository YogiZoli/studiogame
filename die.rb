require_relative "auditable"

class Die
  include Auditable

	attr_reader :number

	def initialize
		roll
	end

	def roll
		@number = rand(1..6)
    audit
    @number
	end

end

if __FILE__ == $0
  die = Die.new
  puts die.roll
  puts die.roll
  puts die.roll
  puts "if the adove numbers were different 
  then Die.RB works fine 
  and generates random numbers"
end