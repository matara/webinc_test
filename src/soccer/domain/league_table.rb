require 'soccer/domain/game'
require 'soccer/domain/team'

require 'common/outputs/stdout'
module Soccer
  module Domain
    class LeagueTable

      attr_accessor :games, :rank_table

      def initialize
        @games = []
        @rank_table = []
      end

      def add_team(team_name)
        team_obj = @rank_table.select { |team| team.name == team_name }.first
        return team_obj if team_obj
        team_obj = Soccer::Domain::Team.new(team_name)
        @rank_table.push team_obj
        team_obj
      end

      def add_game(team1_obj, team2_obj, pts_team1, pts_team2)
        @games.push Soccer::Domain::Game.new(team1_obj, team2_obj, pts_team1, pts_team2)
      end

      def calculate_rank!
        reset_rank_table_points!
        assign_points_to_teams!
        sort_rank_table!
      end

      def reset_rank_table_points!
        @rank_table.each { |team| team.points = 0 }
      end

      def assign_points_to_teams!
        @games.each { |game| game.assign_points_to_teams! }
      end

      def sort_rank_table!
        @rank_table.sort_by! { |t| [-t.points, t.name] }
      end

      def print_rank_table
        stdout = Common::Outputs::Stdout.new
        rank_table_texts.each { |msg| stdout.write(msg) }
      end

      private
      def rank_table_texts
        @rank_table.map.with_index { |team, i| msg(i, team) }
      end

      def msg(i, team)
        "#{i + 1}. #{team.name}, #{pts_text(team.points)}"
      end

      def pts_text(points)
        "#{points} #{points == 1 ? 'pt' : 'pts'}"
      end

    end
  end
end
