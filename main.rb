require "./general_methods"
require "./battlefield"

arr_ships = create_ships # create an array, filled with ships
arr_map = create_map # create an empty array with dots
battlefield = Battlefield.new(arr_ships, arr_map) # create a new battlefield

battlefield.show # output empty battlefield
battlefield.place_ships # insert ships into the map
puts "Game started!"

coordinates = ""
while coordinates != "surrender"
  print "Enter the coordinates of the ship: "
  coordinates = gets.chomp
  battlefield.show # output
end
