require 'test_helper'

require 'soccer/parsers/game_parser'

describe Soccer::Parsers::GameParser do

  let(:parser) { Soccer::Parsers::GameParser.new }

  describe 'correct input' do

    it 'should split string on two teams names and points' do
      expect(parser.split_str('Lions 1, Tigers 1')).must_equal ['Lions', 1, 'Tigers', 1]
    end

    it 'should split string with extra spaces in name on two teams names and points' do
      expect(parser.split_str('Lions 1, FC Awesome ADC 1')).must_equal ['Lions', 1, 'FC Awesome ADC', 1]
    end

  end

end
