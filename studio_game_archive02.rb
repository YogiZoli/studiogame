def say_hello(name, health=100)
	"Hello #{name.capitalize} with a health of #{health} as of #{time}!"
end

def time
	current_time = Time.new
	current_time.strftime("%I :%M :%S")
	
end

name1 = "Larry"
health1 = 60

name2 = "curly"
health2 = 125

name3 = "moe"
health3 = 100

name4 = "shemp"
health4 = 90

puts say_hello(name1, health1)
puts say_hello(name2, health2)

# puts name1

puts say_hello("Moe")