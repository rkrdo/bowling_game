require 'spec_helper'
require 'game'

describe Game do
  let(:g) { Game.new }

  context "with two throws" do
    it 'returns the correct result' do
      g.add 5
      g.add 4
      g.score.must_equal 9
      g.current_frame.must_equal 2
    end
  end

  context "4 throws" do
    it 'returns the score of the requested frame' do
      g.add 5
      g.add 4
      g.add 7
      g.add 2
      g.score.must_equal 18
      g.score_for_frame(1).must_equal 9
      g.score_for_frame(2).must_equal 18
      g.current_frame.must_equal 3
    end
  end

  context "scoring a spare" do
    it 'returns the correct score' do
      g.add 3
      g.add 7
      g.add 3
      g.score_for_frame(1).must_equal 13
      g.current_frame.must_equal 2
    end
  end

  context "score of frame after a spare" do
    it 'returns the correct score' do
      g.add 3
      g.add 7
      g.add 3
      g.add 2
      g.score_for_frame(1).must_equal 13
      g.score_for_frame(2).must_equal 18
      g.score.must_equal 18
      g.current_frame.must_equal 3
    end
  end

  context "simple strike" do
    it 'returns the correct score' do
      g.add 10
      g.add 3
      g.add 6
      g.score_for_frame(1).must_equal 19
      g.score.must_equal 28
      g.current_frame.must_equal 3
    end
  end

end
