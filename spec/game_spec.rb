require 'spec_helper'
require 'game'

describe Game do
  subject { Game.new }

  describe "#get_score" do

    context "with one throw" do
      it 'returns the throws result' do
        subject.add 5
        subject.score.must_equal 5
      end
    end

    context "with two throws" do
      it 'returns the correct result' do
        subject.add 5
        subject.add 4
        subject.score.must_equal 9
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
      end
    end

    context "scoring a spare" do
      it 'returns the correct score' do
        subject.add 3
        subject.add 7
        subject.add 3
        subject.score_for_frame(1).must_equal 13
      end
    end
  end

end
