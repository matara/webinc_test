require 'test_helper'

require 'soccer/domain/league_table'

describe Soccer::Domain::LeagueTable do

  let(:league_table) { Soccer::Domain::LeagueTable.new }

  describe 'initialize' do
    it 'should set games' do
      expect(league_table.games).must_equal []
    end

    it 'should set rank_table' do
      expect(league_table.rank_table).must_equal []
    end
  end

  describe 'add new team' do

    before do
      league_table.add_team('test1')
      expect(league_table.rank_table.size).must_equal 1
    end

    describe 'team present' do

      it 'should not add the same team twice' do
        league_table.add_team('test1')
        expect(league_table.rank_table.size).must_equal 1
      end

      it 'should add new team' do
        league_table.add_team('test2')
        expect(league_table.rank_table.size).must_equal 2
      end

    end
  end

  describe 'add new game' do

    before do
      league_table.add_game(:team, :team, 0, 0)
    end

    it 'should add new game' do
      expect(league_table.games.size).must_equal 1
    end

    it 'should add two games' do
      league_table.add_game(:team, :team, 0, 0)
      expect(league_table.games.size).must_equal 2
    end

  end

  describe 'calculate rank table' do
    before do
      @t1 = league_table.add_team('test1')
      @t2 = league_table.add_team('test2')
      @t3 = league_table.add_team('test3')
      league_table.add_game(@t1, @t2, 1, 1)
      league_table.add_game(@t1, @t3, 1, 3)
      league_table.add_game(@t2, @t3, 1, 0)
      league_table.add_game(@t1, @t3, 0, 3)
    end

    it 'should reset rank table points on rating calculation' do
      expect_call(league_table, :reset_rank_table_points!) do
        league_table.calculate_rank!
      end
    end

    it 'should assign points to teams on rating calculation' do
      expect_call(league_table, :assign_points_to_teams!) do
        league_table.calculate_rank!
      end
    end

    it 'should sort rank table on rating calculation' do
      expect_call(league_table, :sort_rank_table!) do
        league_table.calculate_rank!
      end
    end

    it 'should reset rank table points' do
      league_table.calculate_rank!
      league_table.reset_rank_table_points!
      league_table.rank_table.map(&:points).must_equal [0, 0, 0]
    end

    describe 'assign points' do

      before do
        league_table.assign_points_to_teams!
      end

      it 'should assign points to teams' do
        expect(league_table.rank_table.map(&:points)).must_equal [1, 4, 6]
      end

      it 'should sort rank table by points and name' do
        league_table.sort_rank_table!
        expect(league_table.rank_table.map(&:points)).must_equal [6, 4, 1]
        expect(league_table.rank_table.map(&:name)).must_equal %w[test3 test2 test1]
      end

    end

    describe 'print rank table' do
      it 'should print correct results' do
        league_table.calculate_rank!

        mock = MiniTest::Mock.new
        mock.expect(:write, nil, ['1. test3, 6 pts'])
        mock.expect(:write, nil, ['2. test2, 4 pts'])
        mock.expect(:write, nil, ['3. test1, 1 pt'])

        Common::Outputs::Stdout.stub(:new, mock) do
          league_table.print_rank_table
        end

        mock.verify
      end

    end

  end

end
