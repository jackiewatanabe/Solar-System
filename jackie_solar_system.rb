# Jackie Watanabe
# Solar System assignment
# Feb 14, 2017
# Creates planets and solar systems based on user input and exising information

milkyway = [
 {
        name: "Mercury",
        moons: 0,
        rings: 0,
        diameter: 3032,
        orbital_period: 87.969,
        distance_from_the_sun: 30
      },

      {
        name: "Venus",
        moons: 0,
        rings: 0,
        diameter: 7520.8,
        orbital_period: 224.701,
        distance_from_the_sun: 45
      },

      {
        name: "Earth",
        moons: 1,
        rings: 0,
        diameter: 7917.5,
        orbital_period: 365.256,
        distance_from_the_sun: 21
      }
]

class Planet

attr_accessor :name, :moons, :rings, :diameter, :orbital_period, :distance_from_the_sun

  def initialize(planet_hash)
    @name = planet_hash[:name]
    @moons = planet_hash[:moons]
    @rings = planet_hash[:rings]
    @diameter = planet_hash[:diameter]
    @orbital_period = planet_hash[:orbital_period]

# Give each planet a @distance_from_the_sun attribute
    @distance_from_the_sun = planet_hash[:distance_from_the_sun]

  end

  def print_planet_info
    puts "\n#{@name} has #{@moons} moon(s) and #{@rings} ring(s) and has a diameter of #{@diameter} miles and has an oribital period of #{@orbital_period} days and is #{@distance_from_the_sun}ft from the sun"
  end

end


# mercury_info = {
#           name: "Mercury",
#           moons: 0,
#           rings: 0,
#           diameter: 3032,
#           orbital_period: 87.969,
#           distance_from_the_sun: 30
#         }
#
# venus_info = {
#           name: "Venus",
#           moons: 0,
#           rings: 0,
#           diameter: 7520.8,
#           orbital_period: 224.701,
#           distance_from_the_sun: 45
#         }
#
# earth_info = {
#           name: "Earth",
#           moons: 1,
#           rings: 0,
#           diameter: 7917.5,
#           orbital_period: 365.256,
#           distance_from_the_sun: 21
#         }

class Solar_system
  attr_accessor :system_name, :planets_list

  def initialize(in_system_name, planets_array = [])
    @system_name = in_system_name
    @planets_list = planets_array
  end

  def add_planet(planet_info_hash)
    @planets_list << planet_info_hash
    # puts "#{@planets_list}"
  end

  def list_planets
    @planets_list.each do |planet|
      puts planet.print_planet_info
    end
  end

  def print_system_info
    puts "Your solar system's name is #{@system_name.capitalize}."
    puts "The #{@system_name} System has #{@planets_list.length} planets."
    puts "Those planets are: "

    @planets_list.each do |planet|
      puts planet.name
    end

    puts "\nHere's information about each planet: "
    list_planets

  end

end

puts "You are God!! Let's create a solar system!\n"
puts "Please enter a name for your new, awesome solar system: "
name = gets.chomp

new_system = Solar_system.new(name.capitalize)

new_planet_hash = {}

# Checks to see if user input is Milkyway... and if it is, warns user that there are already planets in that system.
if name.capitalize == "Milkyway" || name.capitalize == "Milky way"

    milkyway.each do |milky_planets|
      new_planet = Planet.new(milky_planets)
      new_system.add_planet(new_planet)
      # new_system.print_system_info
    end
    puts "#{name.capitalize} is an awesome name for your new solar system,"
    puts "but it's already taken and contains planets."
else
   puts "#{name.capitalize} is an awesome name for your new solar system!\n"
   puts "Let's add some planets to that fiiine system!\n"
end

puts "Would you like to add a planet?: "

## checks to see if user wants to add a planet... if yes... queries user about information on the planets

reply = gets.chomp.downcase
until reply == 'yes' || reply == 'no'
  print 'please enter "yes" or "no": '
  reply = gets.chomp.downcase
end


while reply == 'yes'
  # new_planet_hash = {}
  puts "Please enter a planet name: "
  name = gets.chomp.capitalize
  new_planet_hash[:name] = name

  puts "How many moons does #{name} have? "
  moons = gets.chomp.to_i
  new_planet_hash[:moons] = moons

  puts "How many rings does #{name} have? "
  rings = gets.chomp.to_i
  new_planet_hash[:rings] = rings

  puts "What's the diameter of #{name}? "
  diameter = gets.chomp.to_f
  new_planet_hash[:diameter] = diameter

  puts "What's the orbital period of #{name}? "
  orbital_period = gets.chomp.to_f
  new_planet_hash[:orbital_period] = orbital_period

#adds hash of planet info into array in Solar System
  new_planet = Planet.new(new_planet_hash)
  new_system.add_planet(new_planet)

  puts "Would you like to add another planet?"
  reply = gets.chomp.downcase

  until reply == 'yes' || reply == 'no'
    print 'please enter "yes" or "no": '
    reply = gets.chomp.downcase
  end

end

puts "Thanks for playing."
new_system.print_system_info
