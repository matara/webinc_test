require 'thor'

require 'common/inputs/file'
require 'common/inputs/stdin'
require 'soccer/commands/calculate_rank_command'

class SoccerCli < Thor

  desc 'calculate_ranking_table FILE_PATH', 'Calculate the ranking table'

  def calculate_ranking_table(file_path = nil)

    if file_path
      input_array = Common::Inputs::File.new.read(file_path).to_a
    else
      input_array = Common::Inputs::Stdin.new.read
    end

    league_table = Soccer::Commands::CalculateRankCommand.new(input_array: input_array).perform
    league_table.print_rank_table
  end

end
