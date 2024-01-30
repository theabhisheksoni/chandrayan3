require 'simplecov'
SimpleCov.start

require_relative 'spacecraft'

describe Spacecraft do
  describe 'intialization' do
    it 'can be created with a starting point and direction' do
      spacecraft = Spacecraft.new(0, 0, 0, 'W', 'N', 'E')
      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq({ left: 'W', front: 'N', right: 'E' })
    end
  end

  describe '#move' do
    context "when moving forward" do
      context 'facing N' do
        let(:spacecraft)  { Spacecraft.new(0, 0, 0, 'W', 'N', 'E') }
        it 'moves spacecraft forward to north' do
          spacecraft.direction[:front] = 'N'

          commands = ['f']

          spacecraft.execute(commands)

          expected_position = [0, 1, 0]
          expected_direction = 'N'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end

      context 'facing E' do
        let(:spacecraft)  { Spacecraft.new(0, 0, 0, 'N', 'E', 'S') }
        it 'moves spacecraft forward to east' do
          spacecraft.direction[:front] = 'E'
          commands = ['f']
          spacecraft.execute(commands)
          expected_position = [1, 0, 0]
          expected_direction = 'E'
          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end

      context 'facing S' do
        let(:spacecraft)  { Spacecraft.new(0, 0, 0, 'E', 'S', 'W') }
        it 'moves spacecraft forward to south' do
          spacecraft.direction[:front] = 'S'
          commands = ['f']
          spacecraft.execute(commands)
          expected_position = [0, -1, 0]
          expected_direction = 'S'
          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end

      context 'facing W' do
        let(:spacecraft)  { Spacecraft.new(0, 0, 0, 'S', 'W', 'N') }
        it 'moves spacecraft westward' do
          spacecraft.direction[:front] = 'W'
          commands = ['f']
          spacecraft.execute(commands)
          expected_position = [-1, 0, 0]
          expected_direction = 'W'
          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end

      context 'facing U' do
        let(:spacecraft)  { Spacecraft.new(0, 0, 0, 'W', 'U', 'E') }
        it 'moves spacecraft up' do
          spacecraft.direction[:front] = 'U'
          commands = ['f']
          spacecraft.execute(commands)
          expected_position = [0, 0, 1]
          expected_direction = 'U'
          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end

      context 'facing D' do
        let(:spacecraft)  { Spacecraft.new(0, 0, 0, 'W', 'D', 'E') }
        it 'moves spacecraft down' do
          spacecraft.direction[:front] = 'D'
          commands = ['f']
          spacecraft.execute(commands)
          expected_position = [0, 0, -1]
          expected_direction = 'D'
          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end
    end

    context "when moving backward" do
      context 'facing N' do
        let(:spacecraft)  { Spacecraft.new(0, 0, 0, 'W', 'N', 'E') }
        it 'moves spacecraft to north' do
          spacecraft.direction[:front] = 'N'

          commands = ['b']

          spacecraft.execute(commands)

          expected_position = [0, -1, 0]
          expected_direction = 'N'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end

      context 'facing E' do
        let(:spacecraft)  { Spacecraft.new(0, 0, 0, 'N', 'E', 'S') }
        it 'moves spacecraft to east' do
          spacecraft.direction[:front] = 'E'
          commands = ['b']
          spacecraft.execute(commands)
          expected_position = [-1, 0, 0]
          expected_direction = 'E'
          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end

      context 'facing S' do
        let(:spacecraft)  { Spacecraft.new(0, 0, 0, 'E', 'S', 'W') }
        it 'moves spacecraft to south' do
          spacecraft.direction[:front] = 'S'
          commands = ['b']
          spacecraft.execute(commands)
          expected_position = [0, 1, 0]
          expected_direction = 'S'
          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end

      context 'facing W' do
        let(:spacecraft)  { Spacecraft.new(0, 0, 0, 'S', 'W', 'N') }
        it 'moves spacecraft to west' do
          spacecraft.direction[:front] = 'W'
          commands = ['b']
          spacecraft.execute(commands)
          expected_position = [1, 0, 0]
          expected_direction = 'W'
          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end

      context 'facing U' do
        let(:spacecraft)  { Spacecraft.new(0, 0, 0, 'W', 'U', 'E') }
        it 'moves spacecraft up' do
          spacecraft.direction[:front] = 'U'
          commands = ['b']
          spacecraft.execute(commands)
          expected_position = [0, 0, -1]
          expected_direction = 'U'
          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end

      context 'facing D' do
        let(:spacecraft)  { Spacecraft.new(0, 0, 0, 'W', 'D', 'E') }
        it 'moves spacecraft down' do
          spacecraft.direction[:front] = 'D'
          commands = ['b']
          spacecraft.execute(commands)
          expected_position = [0, 0, 1]
          expected_direction = 'D'
          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end
    end
  end

  describe '#turn' do
    context 'turn right' do
      context 'when wheels down' do
        it 'spacecraft turns right to east from north' do
          spacecraft = Spacecraft.new(0, 0, 0, 'W', 'N', 'E')

          commands = ['r']

          spacecraft.execute(commands)

          expected_position = [0, 0, 0]
          expected_direction = 'E'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end

        it 'spacecraft turns right to south from east' do
          spacecraft = Spacecraft.new(0, 0, 0, 'N', 'E', 'S')

          commands = ['r']

          spacecraft.execute(commands)

          expected_position = [0, 0, 0]
          expected_direction = 'S'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end

        it 'spacecraft turns right to west from south' do
          spacecraft = Spacecraft.new(0, 0, 0, 'E', 'S', 'W')

          commands = ['r']

          spacecraft.execute(commands)

          expected_position = [0, 0, 0]
          expected_direction = 'W'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end

        it 'spacecraft turns to north from west' do
          spacecraft = Spacecraft.new(0, 0, 0, 'S', 'W', 'N')

          commands = ['r']

          spacecraft.execute(commands)

          expected_position = [0, 0, 0]
          expected_direction = 'N'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end

      context 'when wheels right' do
        it 'spacecraft turns right to up from north' do
          spacecraft = Spacecraft.new(0, 0, 0, 'D', 'N', 'U')

          commands = ['r']

          spacecraft.execute(commands)

          expected_position = [0, 0, 0]
          expected_direction = 'U'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end

        it 'spacecraft turns right to south from up' do
          spacecraft = Spacecraft.new(0, 0, 0, 'N', 'U', 'S')

          commands = ['r']

          spacecraft.execute(commands)

          expected_position = [0, 0, 0]
          expected_direction = 'S'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end

        it 'spacecraft turns right to down from south' do
          spacecraft = Spacecraft.new(0, 0, 0, 'U', 'S', 'D')

          commands = ['r']

          spacecraft.execute(commands)

          expected_position = [0, 0, 0]
          expected_direction = 'D'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end

        it 'spacecraft turns right to north from down' do
          spacecraft = Spacecraft.new(0, 0, 0, 'S', 'D', 'N')

          commands = ['r']

          spacecraft.execute(commands)

          expected_position = [0, 0, 0]
          expected_direction = 'N'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end
    end

    context 'turn left' do
      context 'when wheels down' do
        it 'spacecraft turns left to west from north' do
          spacecraft = Spacecraft.new(0, 0, 0, 'W', 'N', 'E')

          commands = ['l']

          spacecraft.execute(commands)

          expected_position = [0, 0, 0]
          expected_direction = 'W'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end

        it 'spacecraft turns left to south from west' do
          spacecraft = Spacecraft.new(0, 0, 0, 'S', 'W', 'N')

          commands = ['l']

          spacecraft.execute(commands)

          expected_position = [0, 0, 0]
          expected_direction = 'S'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end

        it 'spacecraft turns left to east from south' do
          spacecraft = Spacecraft.new(0, 0, 0, 'E', 'S', 'W')

          commands = ['l']

          spacecraft.execute(commands)

          expected_position = [0, 0, 0]
          expected_direction = 'E'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end

        it 'spacecraft turns left to north from east' do
          spacecraft = Spacecraft.new(0, 0, 0, 'N', 'E', 'S')

          commands = ['l']

          spacecraft.execute(commands)

          expected_position = [0, 0, 0]
          expected_direction = 'N'

          expect(spacecraft.position).to eq(expected_position)
          expect(spacecraft.direction[:front]).to eq(expected_direction)
        end
      end
    end

    context 'turn Up' do
      context 'when wheels down' do
        context "turn up from North" do
          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'W', 'N', 'E')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'W', 'U', 'E')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'S'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'W', 'S', 'E')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
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
          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'N', 'E', 'S')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'N', 'U', 'S')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'W'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'N', 'W', 'S')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
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
          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'E', 'S', 'W')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'E', 'U', 'W')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'N'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'E', 'N', 'W')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
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
          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'S', 'W', 'N')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'S', 'U', 'N')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'E'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'S', 'E', 'N')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
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

      context 'when wheels right' do
        context "turn up from North" do
          it 'spacecraft turns up to west from north' do
            spacecraft = Spacecraft.new(0, 0, 0, 'D', 'N', 'U')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'W'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'spacecraft turns up to south from west' do
            spacecraft = Spacecraft.new(0, 0, 0, 'D', 'W', 'U')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'S'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'spacecraft turns up to east from south' do
            spacecraft = Spacecraft.new(0, 0, 0, 'D', 'S', 'U')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'E'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'spacecraft turns up to north from east' do
            spacecraft = Spacecraft.new(0, 0, 0, 'D', 'E', 'U')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'N'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end
        end

        context 'turn up from East' do
          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'N', 'E', 'S')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'N', 'U', 'S')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'W'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'N', 'W', 'S')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
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
          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'E', 'S', 'W')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'E', 'U', 'W')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'N'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'E', 'N', 'W')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
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
          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'S', 'W', 'N')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'S', 'U', 'N')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'E'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'S', 'E', 'N')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
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

      context 'when wheels left' do
        context "turn up from North" do
          it 'spacecraft turns up to east from north' do
            spacecraft = Spacecraft.new(0, 0, 0, 'U', 'N', 'D')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'E'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'spacecraft turns up to south from east' do
            spacecraft = Spacecraft.new(0, 0, 0, 'U', 'E', 'D')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'S'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'spacecraft turns up to west from south' do
            spacecraft = Spacecraft.new(0, 0, 0, 'U', 'S', 'D')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'W'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'spacecraft turns up to north from west' do
            spacecraft = Spacecraft.new(0, 0, 0, 'U', 'W', 'D')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'N'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end
        end

        context 'turn up from East' do
          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'N', 'E', 'S')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'N', 'U', 'S')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'W'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'N', 'W', 'S')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
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
          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'E', 'S', 'W')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'E', 'U', 'W')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'N'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'E', 'N', 'W')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
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
          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'S', 'W', 'N')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'S', 'U', 'N')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'E'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'S', 'E', 'N')

            commands = ['u']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft up' do
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

    context 'turn Down' do
      context 'when wheels down' do
        context "turn down from North" do
          it 'turns spacecraft down to down from north' do
            spacecraft = Spacecraft.new(0, 0, 0, 'W', 'N', 'E')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to south from down' do
            spacecraft = Spacecraft.new(0, 0, 0, 'W', 'D', 'E')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'S'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to up from south' do
            spacecraft = Spacecraft.new(0, 0, 0, 'W', 'S', 'E')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to north form up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'W', 'U', 'E')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'N'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end
        end

        context 'turn down from East' do
          it 'turns spacecraft down to down from east' do
            spacecraft = Spacecraft.new(0, 0, 0, 'N', 'E', 'S')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to west from down' do
            spacecraft = Spacecraft.new(0, 0, 0, 'N', 'D', 'S')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'W'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to up from west' do
            spacecraft = Spacecraft.new(0, 0, 0, 'N', 'W', 'S')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to east from up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'N', 'U', 'S')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'E'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end
        end

        context 'turn down from South' do
          it 'turns spacecraft down to down from south' do
            spacecraft = Spacecraft.new(0, 0, 0, 'E', 'S', 'W')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to north form down' do
            spacecraft = Spacecraft.new(0, 0, 0, 'E', 'D', 'W')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'N'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to up from north' do
            spacecraft = Spacecraft.new(0, 0, 0, 'E', 'N', 'W')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to south from up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'E', 'U', 'W')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'S'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end
        end

        context 'turn down from West' do
          it 'turns spacecraft down to down from west' do
            spacecraft = Spacecraft.new(0, 0, 0, 'S', 'W', 'N')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'D'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to east from down' do
            spacecraft = Spacecraft.new(0, 0, 0, 'S', 'D', 'N')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'E'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to up form east' do
            spacecraft = Spacecraft.new(0, 0, 0, 'S', 'E', 'N')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'U'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to west form up' do
            spacecraft = Spacecraft.new(0, 0, 0, 'S', 'U', 'N')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'W'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end
        end
      end

      context 'when wheels right' do
        context "turn down from North" do
          it 'turns spacecraft down to east from north' do
            spacecraft = Spacecraft.new(0, 0, 0, 'D', 'N', 'U')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'E'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to south from east' do
            spacecraft = Spacecraft.new(0, 0, 0, 'D', 'E', 'U')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'S'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to west from south' do
            spacecraft = Spacecraft.new(0, 0, 0, 'D', 'S', 'U')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'W'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to north form west' do
            spacecraft = Spacecraft.new(0, 0, 0, 'D', 'W', 'U')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'N'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end
        end
      end

      context 'when wheels left' do
        context "turn down from North" do
          it 'turns spacecraft down to west from north' do
            spacecraft = Spacecraft.new(0, 0, 0, 'U', 'N', 'D')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'W'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to south from west' do
            spacecraft = Spacecraft.new(0, 0, 0, 'U', 'W', 'D')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'S'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to east from south' do
            spacecraft = Spacecraft.new(0, 0, 0, 'U', 'S', 'D')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'E'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end

          it 'turns spacecraft down to north form east' do
            spacecraft = Spacecraft.new(0, 0, 0, 'U', 'E', 'D')

            commands = ['d']

            spacecraft.execute(commands)

            expected_position = [0, 0, 0]
            expected_direction = 'N'

            expect(spacecraft.position).to eq(expected_position)
            expect(spacecraft.direction[:front]).to eq(expected_direction)
          end
        end
      end
    end
  end
end
