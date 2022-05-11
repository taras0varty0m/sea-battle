require "./general_methods"
require "./battlefield"

arr_ships = create_ships # create an array, filled with ships
arr_map = create_map # create an empty array with dots
battlefield = Battlefield.new(arr_ships, arr_map) # create a new battlefield
health_points = 20

battlefield.full_show # output empty battlefield
battlefield.place_ships # insert ships into the map
puts "Game started!"

coordinates = ""
while health_points != 0
  print "Enter the coordinates of the ship: "
  coordinates = gets.chomp
  if coordinates === "surrender"
    break
  end
  if /^([a-j][1-9]|[a-j]10)$/s.match(coordinates)
    splitted = coordinates.upcase.chars

    coordinate = arr_map[splitted.length === 3 ? 10 : splitted[1].to_i][(splitted[0].ord - 64).to_i]
    if coordinate === "S" || coordinate === "X"
      health_points -= 1
      coordinate = "X"
    else
      coordinate = "O"
    end
    arr_map[splitted.length === 3 ? 10 : splitted[1].to_i][(splitted[0].ord - 64).to_i] = coordinate
    battlefield.show
  else
    puts "Incorect coordinates"
  end
end

if coordinates === "surrender"
  puts "What a shame…"
  battlefield.full_show
else
  puts "You win!"
  battlefield.full_show
end
