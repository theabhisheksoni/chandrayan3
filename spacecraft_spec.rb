require_relative 'spacecraft'

describe Spacecraft do
  it 'can be created with a starting point and direction' do
    spacecraft = Spacecraft.new(0, 0, 0, :l, :f, :r)
    expect(spacecraft.position).to eq([0, 0, 0])
    expect(spacecraft.direction).to eq({ left: :l, front: :f, right: :r })
  end
end