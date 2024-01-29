# lib/spacecraft.rb

class Spacecraft
  attr_reader :position, :direction

  def initialize(x, y, z, l, f, r)
    @position = [x, y, z]
    @direction = { left: l, front: f, right: r }
  end
end
