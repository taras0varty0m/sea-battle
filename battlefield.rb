# frozen_string_literal: true

class Battlefield
  attr_reader :ships, :map

  def initialize(arr_ships, arr_map)
    @ships = arr_ships
    @map = arr_map
  end

  def place_ships
    ships.each do |ship|
      # While optimal random x & y coordinates are not found - loop
      loop do

        x_pos = rand(1..10)
        y_pos = rand(1..10)

        # If horizontal direction ship does not overflow the map
        # and it's direction doesn't cross the rules - break loop
        break if ship.direction == 'along' && x_pos + ship.life <= 11 && check(x_pos, y_pos, ship)

        # If vertical direction ship does not overflow the map
        break if ship.direction == 'across' && (y_pos + ship.life) <= 11 && check(x_pos, y_pos, ship)
      end
    end
  end

  def full_show
    print '  '

    ('A'..'J').to_a.each do |x|
      print " #{x} "
    end

    print "\n"

    1.upto(10) do |y|
      if y != 10
        print "#{y} "
      else
        print y.to_s
      end

      1.upto(10) do |x|
        print " #{map[y][x]} "
      end

      print "\n"
    end
  end

  def show
    print '  '

    ('A'..'J').to_a.each do |x|
      print " #{x} "
    end

    print "\n"

    1.upto(10) do |y|
      if y != 10
        print "#{y} "
      else
        print y.to_s
      end

      1.upto(10) do |x|
        print " #{map[y][x] == 'S' ? '.' : map[y][x]} "
      end

      print "\n"
    end
  end

  private

  def check(x_position, y_position, ship)
    flag = true

    # Check rules for horizontal direction ships
    if ship.direction == 'along'
      x = x_position - 1
      while x < (x_position + ship.life + 1)
        return false if map[y_position][x] != '.' || map[y_position + 1][x] != '.' || map[y_position - 1][x] != '.'

        x += 1
      end
    end

    # Check rules for vertical direction ships
    if ship.direction == 'across'
      y = y_position - 1
      while y < (y_position + ship.life + 1)
        return false if map[y][x_position] != '.' || map[y][x_position + 1] != '.' || map[y][x_position - 1] != '.'

        y += 1
      end
    end

    # If everything is fine - set ship
    set_ship(x_position, y_position, ship) if flag

    flag
  end

  def set_ship(x_pos, y_pos, ship)
    case ship.direction
    when 'along'
      ship.life.times do |x|
        map[y_pos][x_pos + x] = 'S'
      end
    when 'across'
      ship.life.times do |y|
        map[y_pos + y][x_pos] = 'S'
      end
    end
  end
end
