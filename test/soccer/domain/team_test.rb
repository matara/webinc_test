require 'test_helper'

require 'soccer/domain/team'

describe Soccer::Domain::Team do

  let(:team_name) { 'Test_name' }

  describe 'initialize' do
    before do
      @team = Soccer::Domain::Team.new(team_name)
    end

    it 'should set name' do
      expect(@team.name).must_equal team_name
    end

    it 'should set points' do
      expect(@team.points).must_equal 0
    end
  end

end
