require "./ship.rb"

def create_ships
  armada = ["Battleship", "Corvette", "Corvette", "Brig", "Brig", "Brig", "Frigate",
            "Frigate", "Frigate", "Frigate"]
  arr_ships = []

  armada.each_with_index do |var, index|
    case var
    when "Battleship"
      life = 4
    when "Corvette"
      life = 3
    when "Brig"
      life = 2
    when "Frigate"
      life = 1
    end
    arr_ships.push(Ship.new(var, life))
  end
  arr_ships
end

def create_map
  arr_map = Array.new(12).map! { Array.new(12) }

  12.times do |y|
    12.times do |x|
      arr_map[y][x] = "."
    end
  end
  arr_map
end
