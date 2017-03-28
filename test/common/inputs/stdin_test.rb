require 'test_helper'

require 'common/inputs/stdin'

describe Common::Inputs::Stdin do

  let(:stdin) { Common::Inputs::Stdin.new }

  it 'should read input and return array' do
    io = StringIO.new
    io.puts 'Lions 3, Snakes 3'
    io.puts 'Tarantulas 1, FC Awesome 0'
    io.puts 'Lions 1, FC Awesome 1'
    io.puts 'Tarantulas 3, Snakes 1'
    io.puts 'Lions 4, Grouches 0'
    io.rewind

    $stdin = io

    expect(stdin.read).must_equal ['Lions 3, Snakes 3', 'Tarantulas 1, FC Awesome 0',
                                   'Lions 1, FC Awesome 1', 'Tarantulas 3, Snakes 1',
                                   'Lions 4, Grouches 0']
  end

end
