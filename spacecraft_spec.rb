require_relative 'spacecraft'

describe Spacecraft do
  it 'can be created with a starting point and direction' do
    spacecraft = Spacecraft.new(0, 0, 0, :l, :f, :r)
    expect(spacecraft.position).to eq([0, 0, 0])
    expect(spacecraft.direction).to eq({ left: :l, front: :f, right: :r })
  end
end

describe '#execute' do
  context "when moving forward" do
    it 'moves spacecraft based on commands' do
      spacecraft = Spacecraft.new(0, 0, 0, 'l', 'N', 'r')

      commands = ['f']

      spacecraft.execute(commands)

      expected_position = [0, 1, 0]
      expected_direction = 'N'

      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'moves spacecraft forward to east' do
      spacecraft = Spacecraft.new(0, 0, 0, 'l', 'E', 'r')
      commands = ['f']
      spacecraft.execute(commands)
      expected_position = [1, 0, 0]
      expected_direction = 'E'
      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'moves spacecraft forward to south' do
      spacecraft = Spacecraft.new(0, 0, 0, 'l', 'S', 'r')
      commands = ['f']
      spacecraft.execute(commands)
      expected_position = [0, -1, 0]
      expected_direction = 'S'
      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'moves spacecraft westward' do
      spacecraft = Spacecraft.new(0, 0, 0, 'l', 'W', 'r')
      commands = ['f']
      spacecraft.execute(commands)
      expected_position = [-1, 0, 0]
      expected_direction = 'W'
      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'moves spacecraft upward' do
      spacecraft = Spacecraft.new(0, 0, 0, 'l', 'U', 'r')
      commands = ['f']
      spacecraft.execute(commands)
      expected_position = [0, 0, 1]
      expected_direction = 'U'
      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'moves spacecraft downward' do
      spacecraft = Spacecraft.new(0, 0, 0, 'l', 'D', 'r')
      commands = ['f']
      spacecraft.execute(commands)
      expected_position = [0, 0, -1]
      expected_direction = 'D'
      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end
  end

  context "when moving backward" do
    it 'moves spacecraft to north' do
      spacecraft = Spacecraft.new(0, 0, 0, 'l', 'N', 'r')

      commands = ['b']

      spacecraft.execute(commands)

      expected_position = [0, -1, 0]
      expected_direction = 'N'

      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'moves spacecraft to east' do
      spacecraft = Spacecraft.new(0, 0, 0, 'l', 'E', 'r')
      commands = ['b']
      spacecraft.execute(commands)
      expected_position = [-1, 0, 0]
      expected_direction = 'E'
      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'moves spacecraft to south' do
      spacecraft = Spacecraft.new(0, 0, 0, 'l', 'S', 'r')
      commands = ['b']
      spacecraft.execute(commands)
      expected_position = [0, 1, 0]
      expected_direction = 'S'
      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'moves spacecraft to west' do
      spacecraft = Spacecraft.new(0, 0, 0, 'l', 'W', 'r')
      commands = ['b']
      spacecraft.execute(commands)
      expected_position = [1, 0, 0]
      expected_direction = 'W'
      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'moves spacecraft up' do
      spacecraft = Spacecraft.new(0, 0, 0, 'l', 'U', 'r')
      commands = ['b']
      spacecraft.execute(commands)
      expected_position = [0, 0, -1]
      expected_direction = 'U'
      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'moves spacecraft down' do
      spacecraft = Spacecraft.new(0, 0, 0, 'l', 'D', 'r')
      commands = ['b']
      spacecraft.execute(commands)
      expected_position = [0, 0, 1]
      expected_direction = 'D'
      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end
  end
end

describe '#turn' do
  context 'turn right' do
    it 'turns spacecraft to the right from north' do
      spacecraft = Spacecraft.new(0, 0, 0, 'W', 'N', 'E')

      commands = ['r']

      spacecraft.execute(commands)

      expected_position = [0, 0, 0]
      expected_direction = 'E'

      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'turns spacecraft to the right from north' do
      spacecraft = Spacecraft.new(0, 0, 0, 'N', 'E', 'S')

      commands = ['r']

      spacecraft.execute(commands)

      expected_position = [0, 0, 0]
      expected_direction = 'S'

      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'turns spacecraft to the right from north' do
      spacecraft = Spacecraft.new(0, 0, 0, 'E', 'S', 'W')

      commands = ['r']

      spacecraft.execute(commands)

      expected_position = [0, 0, 0]
      expected_direction = 'W'

      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'turns spacecraft to the right from north' do
      spacecraft = Spacecraft.new(0, 0, 0, 'S', 'W', 'N')

      commands = ['r']

      spacecraft.execute(commands)

      expected_position = [0, 0, 0]
      expected_direction = 'N'

      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end
  end

  context 'turn left' do
    it 'turns spacecraft to the left from north' do
      spacecraft = Spacecraft.new(0, 0, 0, 'W', 'N', 'E')

      commands = ['l']

      spacecraft.execute(commands)

      expected_position = [0, 0, 0]
      expected_direction = 'W'

      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'turns spacecraft to the left from north' do
      spacecraft = Spacecraft.new(0, 0, 0, 'S', 'W', 'N')

      commands = ['l']

      spacecraft.execute(commands)

      expected_position = [0, 0, 0]
      expected_direction = 'S'

      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'turns spacecraft to the left from north' do
      spacecraft = Spacecraft.new(0, 0, 0, 'E', 'S', 'W')

      commands = ['l']

      spacecraft.execute(commands)

      expected_position = [0, 0, 0]
      expected_direction = 'E'

      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end

    it 'turns spacecraft to the left from north' do
      spacecraft = Spacecraft.new(0, 0, 0, 'N', 'E', 'S')

      commands = ['l']

      spacecraft.execute(commands)

      expected_position = [0, 0, 0]
      expected_direction = 'N'

      expect(spacecraft.position).to eq(expected_position)
      expect(spacecraft.direction[:front]).to eq(expected_direction)
    end
  end

  context 'turn Up' do
    context "turn up from North" do
      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'W', 'N', 'E')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'U'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end

      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'W', 'U', 'E')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'S'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end

      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'W', 'S', 'E')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'D'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end

      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'W', 'D', 'E')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'N'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end
    end

    context 'turn up from East' do
      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'N', 'E', 'S')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'U'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end

      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'N', 'U', 'S')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'W'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end

      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'N', 'W', 'S')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'D'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end

      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'N', 'D', 'S')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'E'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end
    end

    context 'turn up from South' do
      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'E', 'S', 'W')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'U'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end

      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'E', 'U', 'W')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'N'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end

      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'E', 'N', 'W')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'D'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end

      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'E', 'D', 'W')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'S'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end
    end

    context 'turn up from West' do
      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'S', 'W', 'N')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'U'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end

      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'S', 'U', 'N')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'E'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end

      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'S', 'E', 'N')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'D'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end

      it 'turns spacecraft upwards' do
        spacecraft = Spacecraft.new(0, 0, 0, 'S', 'D', 'N')

        commands = ['u']

        spacecraft.execute(commands)

        expected_position = [0, 0, 0]
        expected_direction = 'W'

        expect(spacecraft.position).to eq(expected_position)
        expect(spacecraft.direction[:front]).to eq(expected_direction)
      end
    end
  end
end