# frozen_string_literal: true

require './general_methods'
require './battlefield'

# create an array, filled with ships
ships = create_ships
# create an empty array with dots
map = create_map
# create a new battlefield
battlefield = Battlefield.new(ships, map)
health_points = 20

# output empty battlefield
battlefield.full_show
# insert ships into the map
battlefield.place_ships

puts 'Game started!'

def win
  puts 'You win!'
end

def surrender
  puts 'What a shame…'
end

loop do
  print 'Enter the coordinates of the ship: '

  coordinates = gets.chomp.upcase

  break surrender if coordinates == 'SURRENDER'

  if /^([A-J][1-9]|[A-J]10)$/s.match(coordinates)
    command = coordinates.chars

    position_x = command.length == 3 ? 10 : command[1].to_i
    position_y = (command[0].ord - 64).to_i

    coordinate = map[position_x][position_y]

    case coordinate
    when 'S'
      health_points -= 1
      coordinate = 'X'
    when 'X'
      next
    else
      coordinate = 'O'
    end

    map[position_x][position_y] = coordinate

    battlefield.show
  else
    puts 'Incorrect coordinates.'
  end

  break win if health_points.zero?
end

battlefield.full_show
