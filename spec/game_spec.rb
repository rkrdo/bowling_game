require 'spec_helper'
require 'game'

describe Game do
  let(:g) { Game.new }

  it 'two throws no mark' do
    g.add 5
    g.add 4
    g.score.must_equal 9
  end

  it 'four throws no mark' do
    g.add 5
    g.add 4
    g.add 7
    g.add 2
    g.score.must_equal 18
    g.score_for_frame(1).must_equal 9
    g.score_for_frame(2).must_equal 18
  end

  it 'simple spare' do
    g.add 3
    g.add 7
    g.add 3
    g.score_for_frame(1).must_equal 13
  end

  it 'simple frame after spare' do
    g.add 3
    g.add 7
    g.add 3
    g.add 2
    g.score_for_frame(1).must_equal 13
    g.score_for_frame(2).must_equal 18
    g.score.must_equal 18
  end

  it 'simple strike' do
    g.add 10
    g.add 3
    g.add 6
    g.score_for_frame(1).must_equal 19
    g.score.must_equal 28
  end

  it 'perfect game' do
    12.times { g.add 10 }
    g.score.must_equal 300
  end

  it 'end of array' do
    9.times { g.add 0 }
    g.add 2
    g.add 8 # spare on 10th frame
    g.add 10 # strike in last position of array
    g.score.must_equal 20
  end

  it 'sample game' do
    g.add 1
    g.add 4
    g.add 4
    g.add 5
    g.add 6
    g.add 4
    g.add 5
    g.add 5
    g.add 10
    g.add 0
    g.add 1
    g.add 7
    g.add 3
    g.add 6
    g.add 4
    g.add 10
    g.add 2
    g.add 8
    g.add 6
    g.score.must_equal 133
  end

  it 'heart break' do
    11.times { g.add 10 }
    g.add 9
    g.score.must_equal 299
  end

  it 'tenth frame spare' do
    9.times { g.add 10 }
    g.add 9
    g.add 1
    g.add 1
    g.score.must_equal 270
  end

end
