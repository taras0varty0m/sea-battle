# frozen_string_literal: true

require './ship'

def create_ships
  ships = %w[Battleship Corvette Corvette Brig Brig Brig Frigate Frigate Frigate Frigate]
  arr_ships = []

  ships.each do |var|
    life = case var
           when 'Battleship'
             4
           when 'Corvette'
             3
           when 'Brig'
             2
           else 'Frigate'
                1
           end

    arr_ships << (Ship.new(var, life))
  end

  arr_ships
end

def create_map
  arr_map = Array.new(12).map! { Array.new(12) }

  12.times do |y|
    12.times do |x|
      arr_map[y][x] = '.'
    end
  end

  arr_map
end
