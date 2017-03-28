require 'test_helper'
require 'interfaces/cli'

require 'soccer/commands/calculate_rank_command'

describe Soccer::Commands::CalculateRankCommand do

  let(:command) { Soccer::Commands::CalculateRankCommand.new(input_array: []) }

  it 'should calculate the ranking table' do
    expect(command.perform.class).must_equal Soccer::Domain::LeagueTable
  end

end
