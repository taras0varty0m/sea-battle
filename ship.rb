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

	def set_position					# sets random position of the ship
		position = ["across", "along"]
		position[Random.rand(2)]
	end
end