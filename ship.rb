class Ship
  def initialize(name, life)
    @name = name
    @life = life
    @position = set_position
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

  def set_position
    position = %w[across along]
    position[Random.rand(2)]
  end
end
