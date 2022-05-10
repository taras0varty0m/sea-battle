require "./general_methods.rb"
require "./battlefield.rb"

arr_ships = create_ships							# create an array, filled with ships
arr_map = create_map								# create an empty array with dots
battlefield = Battlefield.new(arr_ships, arr_map)	# create a new battlefield

battlefield.show									# output empty battlefield
battlefield.place_ships								# insert ships into the map
puts "Game started!"
battlefield.show									# output