# lib/spacecraft.rb

class Spacecraft
  attr_reader :position, :direction

  def initialize(x, y, z, l, f, r)
    @position = [x, y, z]
    @direction = { left: l, front: f, right: r }
  end

  def execute(commands)
    commands.each do |command|
      process(command)
    end
    x, y, z = @position
    puts "Final Position: (#{x}, #{y}, #{z})"
    puts "Final Direction: #{@direction[:front]}"
  end

  def process(command)
    case command
    when 'f'
      move(command)
    end
  end

  def move(command)
    case command
    when 'f'
      case @direction[:front]
      when 'N'
        @position[1] += 1
      when 'S'
        @position[1] -= 1
      when 'E'
        @position[0] += 1
      when 'W'
        @position[0] -= 1
      when 'U'
        @position[2] += 1
      when 'D'
        @position[2] -= 1
      end
    end
  end
end
