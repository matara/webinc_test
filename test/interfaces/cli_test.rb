require 'stringio'

require 'test_helper'
require 'interfaces/cli'

require 'soccer/commands/calculate_rank_command'

describe SoccerCli do

  let(:cli) { SoccerCli.new }
  let(:input_file_path) { 'test/fixtures/input_file.txt' }

  describe 'Calculate the ranking table' do

    it 'should calculate the ranking table from file' do
      options = {input_array: ['Lions 3, Snakes 3',
                               'Tarantulas 1, FC Awesome 0',
                               'Lions 1, FC Awesome 1',
                               'Tarantulas 3, Snakes 1',
                               'Lions 4, Grouches 0']}
      expect_call(Soccer::Commands::CalculateRankCommand, :new, options) do
        cli.calculate_ranking_table(input_file_path)
      end
    end

    it 'should calculate the ranking table from manual input' do
      io = StringIO.new
      io.puts 'Lions 3, Snakes 3'
      io.puts 'Tarantulas 1, FC Awesome 0'
      io.puts 'Lions 1, FC Awesome 1'
      io.puts 'Tarantulas 3, Snakes 1'
      io.puts 'Lions 4, Grouches 0'
      io.rewind

      $stdin = io

      options = {input_array: ['Lions 3, Snakes 3',
                               'Tarantulas 1, FC Awesome 0',
                               'Lions 1, FC Awesome 1',
                               'Tarantulas 3, Snakes 1',
                               'Lions 4, Grouches 0']}
      expect_call(Soccer::Commands::CalculateRankCommand, :new, options) do
        cli.calculate_ranking_table
      end
    end

  end

end
