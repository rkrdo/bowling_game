require 'spec_helper'
require 'game'

describe Game do
  subject { Game.new }

  describe "#get_score" do

    context "with two throws" do
      it 'returns the correct result' do
        subject.add 5
        subject.add 4
        subject.score.must_equal 9
        subject.current_frame.must_equal 2
      end
    end

  end

  describe "#score_for_frame" do
    context "4 throws" do
      it 'returns the score of the requested frame' do
        subject.add 5
        subject.add 4
        subject.add 7
        subject.add 2
        subject.score.must_equal 18
        subject.score_for_frame(1).must_equal 9
        subject.score_for_frame(2).must_equal 18
        subject.current_frame.must_equal 3
      end
    end

    context "scoring a spare" do
      it 'returns the correct score' do
        subject.add 3
        subject.add 7
        subject.add 3
        subject.score_for_frame(1).must_equal 13
        subject.current_frame.must_equal 2
      end
    end

  end

  describe "score of frame after a spare" do
    it 'returns the correct score' do
      subject.add 3
      subject.add 7
      subject.add 3
      subject.add 2
      subject.score_for_frame(1).must_equal 13
      subject.score_for_frame(2).must_equal 18
      subject.score.must_equal 18
      subject.current_frame.must_equal 3
    end
  end

end
