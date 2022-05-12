# frozen_string_literal: true

class Battlefield
  attr_reader :ships, :map

  def initialize(arr_ships, arr_map)
    @ships = arr_ships
    @map = arr_map
  end

  def place_ships
    # TODO: if you are going through ships, then each item should be named accordingly
    ships.each do |ship|
      loop do # While optimal random x & y coordinates are not found - loop

        # TODO: can be simplified by rand(1..10)
        x_pos = rand(1..10)
        y_pos = (1 + Random.rand(10))

        # TODO: parentheses in expressions are unnecessary
        #
        # If horizontal positioned ship does not overflow the map
        # and it's position doesn't cross the rules - break loop
        break if ship.position == "along" && x_pos + ship.life <= 11 && check(x_pos, y_pos, ship)

        # TODO: the same as above
        if (ship.position == "across" && (y_pos + ship.life) <= 11) # If vertical positioned ship does not overflow the map
          break if check(x_pos, y_pos, ship) # And it's position doesn't cross the rules - break loop
        end
      end
    end
  end

  def full_show
    print "  "

    # TODO: can be simplified by ('A'..'J').to_a.each
    1.upto(10) do |x|
      print " #{(x + 64).chr} "
    end

    print "\n"

    1.upto(10) do |y|
      if y != 10
        print "#{y} "
      else
        # TODO: can be simplified by print y.to_s
        print "#{y}"
      end

      1.upto(10) do |x|
        print " #{map[y][x]} "
      end

      print "\n"
    end
  end

  def show
    print "  "

    # TODO: the same as above
    1.upto(10) do |x|
      print " #{(x + 64).chr} "
    end

    print "\n"

    1.upto(10) do |y|
      if y != 10
        print "#{y} "
      else
        # TODO: the same as above
        print "#{y}"
      end

      # TODO: avoid to use of the case equality operator ===
      1.upto(10) do |x|
        print " #{map[y][x] == "S" ? "." : map[y][x]} "
      end

      print "\n"
    end
  end

  private

  # TODO: variables must be named by their meaning and without abbreviations
  def check(x_p, y_p, obj)
    flag = true

    # TODO: parentheses in expressions are unnecessary
    if (obj.position == "along") # Check rules for horizontal positioned ships
      # TODO: count variable is unnecessary
      count = x = x_p - 1
      while x < (x_p + obj.life + 1)
        if (map[y_p][x] != "." || map[y_p + 1][x] != "." || map[y_p - 1][x] != ".")

          # TODO: you can just return false in this case
          flag = false
          break
        end
        x += 1
      end
    end

    # TODO: the same as above
    if (obj.position == "across") # Check rules for vertical positioned ships
      # TODO: the same as above
      count = y = y_p - 1
      while y < (y_p + obj.life + 1)
        if (map[y][x_p] != "." || map[y][x_p + 1] != "." || map[y][x_p - 1] != ".")

          # TODO: the same as above
          flag = false
          break
        end
        y += 1
      end
    end

    set_ship(x_p, y_p, obj) if flag  # If everything is fine - set ship

    flag
  end

  def set_ship(x_pos, y_pos, ship)
    case ship.position
    when "along"
      ship.life.times do |x|
        map[y_pos][x_pos + x] = "S"
      end
    when "across"
      ship.life.times do |y|
        map[y_pos + y][x_pos] = "S"
      end
    end
  end
end
