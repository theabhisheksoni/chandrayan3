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
    when 'f', 'b'
      move(command)
    when 'r'
      turn(command)
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
    when 'b'
      case @direction[:front]
      when 'N'
        @position[1] -= 1
      when 'S'
        @position[1] += 1
      when 'E'
        @position[0] -= 1
      when 'W'
        @position[0] += 1
      when 'U'
        @position[2] -= 1
      when 'D'
        @position[2] += 1
      end
    end
  end

  def turn(command)
    case command
    when 'r'
      turn_right
    end
  end

  def turn_right
    @direction[:left] = @direction[:front]
    @direction[:front] = @direction[:right]
    @direction[:right] = opposite(@direction[:left])
  end

  def opposite(dir)
    case dir
    when 'N'
      'S'
    when 'S'
      'N'
    when 'E'
      'W'
    when 'W'
      'E'
    when 'U'
      'D'
    when 'D'
      'U'
    end
  end
end
