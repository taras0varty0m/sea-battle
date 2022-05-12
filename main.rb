# frozen_string_literal: true

require './general_methods'
require './battlefield'

# TODO
#   1. replace all === operators to ==
#   2. comments should be above the line commented on
#   3. rename all variables so that there is no abbreviation and it is immediately clear what is stored in it

arr_ships = create_ships # create an array, filled with ships
arr_map = create_map # create an empty array with dots
battlefield = Battlefield.new(arr_ships, arr_map) # create a new battlefield
health_points = 20

battlefield.full_show # output empty battlefield
battlefield.place_ships # insert ships into the map

puts 'Game started!'

def win
  puts 'You win!'
end

def surrender
  puts 'What a shame…'
end

loop do
  print 'Enter the coordinates of the ship: '

  # TODO: fix incorrect coordinates error on SuRReNdEr, A1
  coordinates = gets.chomp

  break surrender if coordinates === 'surrender'

  if /^([a-j][1-9]|[a-j]10)$/s.match(coordinates)
    command = coordinates.upcase.chars

    coordinate = arr_map[command.length === 3 ? 10 : command[1].to_i][(command[0].ord - 64).to_i]

    # TODO: fix the bug if you shoot at an already damaged ship 20 times
    if coordinate === 'S' || coordinate === 'X'
      health_points -= 1
      coordinate = 'X'
    else
      coordinate = 'O'
    end

    # TODO: duplicate fragments
    #   command.length === 3 ? 10 : command[1].to_i
    #   (command[0].ord - 64).to_i
    arr_map[command.length === 3 ? 10 : command[1].to_i][(command[0].ord - 64).to_i] = coordinate

    battlefield.show
  else
    puts 'Incorrect coordinates.'
  end

  break win if health_points.zero?
end

battlefield.full_show
