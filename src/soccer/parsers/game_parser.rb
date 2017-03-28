module Soccer
  module Parsers
    class GameParser

      # Example:
      # input: "Lions 1, FC Awesome 1"
      # output: ["Lions", 1, "FC Awesome", 1]
      def split_str(str)
        teams = str.split(',')

        name_team1, pts_team1 = split_name_and_points(teams[0])
        name_team2, pts_team2 = split_name_and_points(teams[1])

        [name_team1, pts_team1, name_team2, pts_team2]
      end

      private

      # Example:
      # input: "FC Awesome 1"
      # output: ["FC Awesome", 1]
      def split_name_and_points(team_str)
        team_data = team_str.split(' ')
        name_team = team_data[0..-2].join(' ')
        pts_team = team_data[-1].to_i

        [name_team, pts_team]
      end

    end
  end
end
