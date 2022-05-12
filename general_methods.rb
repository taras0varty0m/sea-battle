# frozen_string_literal: true

require './ship'

def create_ships
  # TODO
  #   1. convert to %w syntax, or you can use symbols like %i[battleship corvette ...]
  #   2. variables containing multiple values must have a plural name
  armada = ['Battleship', 'Corvette', 'Corvette', 'Brig', 'Brig', 'Brig', 'Frigate', 'Frigate', 'Frigate', 'Frigate']
  arr_ships = []

  # TODO
  #   1. unused parameters must be named _
  #   2. and if there are several of them, they must start with _
  #   3. replace to regular .each method
  armada.each_with_index do |var, index|
    life = case var
           when 'Battleship'
             4
           when 'Corvette'
             3
           when 'Brig'
             2
           when 'Frigate'
             1
           end

    # TODO: change push operator to <<
    arr_ships.push(Ship.new(var, life))
  end

  arr_ships
end

def create_map
  # TODO: why 12?
  arr_map = Array.new(12).map! { Array.new(12) }

  12.times do |y|
    12.times do |x|
      arr_map[y][x] = '.'
    end
  end

  arr_map
end
