require 'game'
require 'spec_helper'

describe Game do

  describe "#get_score" do

    context "with one throw" do
      it 'returns the throws result' do
        g = Game.new
        g.add 5
        g.score.must_equal 5
      end
    end

    context "with two throws" do
      it 'returns the correct result' do
        g = Game.new
        g.add 5
        g.add 4
        g.score.must_equal 9
      end
    end

  end

end
