# frozen_string_literal: true

class Ship
  DIRECTIONS = %w[across along].freeze

  def initialize(name, life)
    @name = name
    @life = life

    initialize_direction
  end

  attr_reader :name, :life, :direction

  private

  def initialize_direction
    @direction = DIRECTIONS.sample

  end
end
