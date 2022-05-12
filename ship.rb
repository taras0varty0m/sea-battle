# frozen_string_literal: true

# TODO
#   use attr_reader to access instance variables instead of getters
#   rename position to direction
#   move positions to a constant

class Ship
  def initialize(name, life)
    @name = name
    @life = life

    @position = initialize_position
  end

  def name
    @name
  end

  def life
    @life
  end

  def position
    @position
  end

  private

  def initialize_position
    position = %w[across along]
    position[Random.rand(2)]
  end
end
