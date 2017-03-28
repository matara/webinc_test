module Soccer
  module Domain
    class Game

      WIN_POINTS = 3
      DRAW_POINTS = 1

      def initialize(team1, team2, pts_team1, pts_team2)
        @team1 = team1
        @team2 = team2
        @pts_team1 = pts_team1
        @pts_team2 = pts_team2
      end

      def team1_win?
        @pts_team1 > @pts_team2
      end

      def is_draw?
        @pts_team1 == @pts_team2
      end

      def assign_points_to_teams!
        if team1_win?
          @team1.points += WIN_POINTS
        elsif is_draw?
          @team1.points += DRAW_POINTS
          @team2.points += DRAW_POINTS
        else
          @team2.points += WIN_POINTS
        end
      end

    end
  end
end
