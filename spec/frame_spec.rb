require 'frame'
require 'minitest/autorun'
require 'minitest-spec-context'

describe Frame do

  describe "#get_score" do
    context "with no throws" do
      it 'returns a score of 0' do
        f = Frame.new
        f.get_score.must_equal 0
      end
    end
  end

end
