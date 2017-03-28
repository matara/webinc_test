require 'test_helper'

require 'soccer/domain/game'

describe Soccer::Domain::Game do

  let(:game) { Soccer::Domain::Game }
  let(:team1) { Soccer::Domain::Team.new('Test1') }
  let(:team2) { Soccer::Domain::Team.new('Test2') }

  describe 'team1 win' do
    before do
      @game = game.new(team1, team2, 1, 0)
    end

    it 'should win' do
      expect(@game.team1_win?).must_equal true
    end

    it 'should assign 3 points to team1 and 0 to team2' do
      @game.assign_points_to_teams!
      expect(team1.points).must_equal 3
      expect(team2.points).must_equal 0
    end
  end

  describe 'a draw' do
    before do
      @game = game.new(team1, team2, 1, 1)
    end

    it 'should be a draw' do
      expect(@game.is_draw?).must_equal true
    end

    it 'should assign 1 point to team1 and to team2' do
      @game.assign_points_to_teams!
      expect(team1.points).must_equal 1
      expect(team2.points).must_equal 1
    end
  end

  describe 'team1 lose' do
    before do
      @game = game.new(team1, team2, 0, 1)
    end

    it 'should lose' do
      expect(@game.team1_win?).must_equal false
    end

    it 'should assign 0 points to team1 and 3 to team2' do
      @game.assign_points_to_teams!
      expect(team1.points).must_equal 0
      expect(team2.points).must_equal 3
    end
  end

end
