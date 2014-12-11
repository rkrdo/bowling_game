require 'spec_helper'
require 'frame'

describe Frame do

  describe "#get_score" do
    context "with no throws" do
      it 'returns a score of 0' do
        f = Frame.new
        f.get_score.must_equal 0
      end
    end

    context "with one throw" do
      it "returns the throw's result" do
        f = Frame.new
        f.add 5
        f.get_score.must_equal 5
      end
    end
  end

end
