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
    when 'r', 'l', 'u'
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
    when 'l'
      turn_left
    when 'u'
      turn_up
    end
  end

  def turn_right
    @direction[:left] = @direction[:front]
    @direction[:front] = @direction[:right]
    @direction[:right] = opposite(@direction[:left])
  end

  def turn_left
    @direction[:right] = @direction[:front]
    @direction[:front] = @direction[:left]
    @direction[:left] = opposite(@direction[:right])
  end

  def turn_up
    if @direction[:left] == 'W'
      case @direction[:front]
      when 'N'
        @direction[:front] = 'U'
      when 'U'
        @direction[:front] = 'S'
      when 'S'
        @direction[:front] = 'D'
      when 'D'
        @direction[:front] = 'N'
      end
    elsif @direction[:left] == 'N'
      case @direction[:front]
      when 'E'
        @direction[:front] = 'U'
      when 'U'
        @direction[:front] = 'W'
      when 'W'
        @direction[:front] = 'D'
      when 'D'
        @direction[:front] = 'E'
      end
    elsif @direction[:left] == 'E'
      case @direction[:front]
      when 'S'
        @direction[:front] = 'U'
      when 'U'
        @direction[:front] = 'N'
      when 'N'
        @direction[:front] = 'D'
      when 'D'
        @direction[:front] = 'S'
      end
    elsif @direction[:left] == 'S'
      case @direction[:front]
      when 'W'
        @direction[:front] = 'U'
      when 'U'
        @direction[:front] = 'E'
      when 'E'
        @direction[:front] = 'D'
      when 'D'
        @direction[:front] = 'W'
      end
    elsif @direction[:left] == 'U'
      case @direction[:front]
      when 'N'
        @direction[:front] = 'E'
      when 'E'
        @direction[:front] = 'S'
      when 'S'
        @direction[:front] = 'W'
      when 'W'
        @direction[:front] = 'N'
      end
    elsif @direction[:left] == 'D'
      case @direction[:front]
      when 'N'
        @direction[:front] = 'W'
      when 'W'
        @direction[:front] = 'S'
      when 'S'
        @direction[:front] = 'E'
      when 'E'
        @direction[:front] = 'N'
      end
    end
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
