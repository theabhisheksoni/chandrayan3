require_relative 'spacecraft'

describe Spacecraft do
  it 'can be created with a starting point and direction' do
    spacecraft = Spacecraft.new(0, 0, 0, :l, :f, :r)
    expect(spacecraft.position).to eq([0, 0, 0])
    expect(spacecraft.direction).to eq({ left: :l, front: :f, right: :r })
  end
end

describe '#execute' do
  it 'moves spacecraft based on commands' do
    spacecraft = Spacecraft.new(0, 0, 0, 'l', 'N', 'r')

    commands = ['f']

    spacecraft.execute(commands)

    expected_position = [0, 1, 0]
    expected_direction = 'N'

    expect(spacecraft.position).to eq(expected_position)
    expect(spacecraft.direction[:front]).to eq(expected_direction)
  end
end
