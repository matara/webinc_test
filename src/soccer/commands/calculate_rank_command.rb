require 'soccer/domain/league_table'
require 'soccer/parsers/game_parser'

module Soccer
  module Commands
    class CalculateRankCommand

      def initialize(input_array:)
        @input_array = input_array
        @league_table = Soccer::Domain::LeagueTable.new
        @game_parser = Soccer::Parsers::GameParser.new
      end

      def perform
        fill_league_table
        @league_table.calculate_rank!
        @league_table
      end

      private

      def fill_league_table
        @input_array.each do |row|
          name_team1, pts_team1, name_team2, pts_team2 = @game_parser.split_str(row)
          team1_obj = @league_table.add_team(name_team1)
          team2_obj = @league_table.add_team(name_team2)
          @league_table.add_game(team1_obj, team2_obj, pts_team1, pts_team2)
        end
      end

    end
  end
end
