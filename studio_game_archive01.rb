# greeting = "Yo!"


# 3.times do 
# 	puts greeting.upcase
# end

# puts "Game has been started at:"
# puts Time.now

puts self
puts self.class


name1 = "Larry"
health1 = 60

name2 = "curly"
health2 = 125

name3 = "moe"
health3 = 100

name4 = "shemp"
health4 = 90

# puts name1 + '\'s health is ' + health1.to_s

puts "#{name1}\s health is #{health1 * 3}"
puts "#{name1}\s health is #{health1 * 9}"
puts "#{name1}\s health is #{health1 * 9.0}"

puts "Players: \n\t larry \n\t curly \n\t moe"

puts "#{name1.capitalize}\s health is #{health1}"
puts "#{name2.upcase}\s health is #{health2}"

health2 = health1

puts "#{name2.upcase}\s health is #{health2}"

health1 = 30

puts ">>>>>>>>>>>"

puts "#{name1.capitalize}\s health is #{health1}"
puts "#{name2.upcase}\s health is #{health2}"

puts "the 3rd player: \n"

puts "#{name3.capitalize} has a health of #{health3}.".center(50, '*')

puts "the 4th player: \n"

puts "#{name4.capitalize.ljust(30, '.')} #{health4} health"
