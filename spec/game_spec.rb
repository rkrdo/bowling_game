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

  describe "#score_for_frame" do
    context "4 throws" do
      it 'returns the score of the requested frame' do
        g = Game.new
        g.add 5
        g.add 4
        g.add 7
        g.add 2
        g.score.must_equal 18
        g.score_for_frame(1).must_equal 9
        g.score_for_frame(2).must_equal 18
      end
    end
  end

end
