require 'test_helper'

require 'common/inputs/file'

describe Common::Inputs::File do

  let(:file) { Common::Inputs::File.new }
  let(:input_file_path) { 'test/fixtures/input_file.txt' }

  it 'should return self object' do
    expect(file.read(input_file_path).class).must_equal Common::Inputs::File
  end

  it 'should open file and save to variable' do
    expect(file.read(input_file_path).file.class).must_equal File
  end

  it 'should split file by new line character' do
    expect(file.read(input_file_path).to_a).must_equal ['Lions 3, Snakes 3', 'Tarantulas 1, FC Awesome 0',
                                                        'Lions 1, FC Awesome 1', 'Tarantulas 3, Snakes 1',
                                                        'Lions 4, Grouches 0']
  end

end
