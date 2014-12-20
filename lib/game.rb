require 'scorer'

class Game

  def initialize
    @current_frame = 1
    @first_throw_in_frame = true
    @scorer = Scorer.new
  end

  def score
    score_for_frame(current_frame - 1)
  end

  def current_frame
    @current_frame
  end

  def add(pins)
    @scorer.add_throw pins
    adjust_current_frame(pins)
  end

  def score_for_frame(the_frame)
    @scorer.score_for_frame the_frame
  end

  private

  def adjust_current_frame(pins)
    if @first_throw_in_frame
      if adjust_frame_for_strike(pins) == false
        @first_throw_in_frame = false
      end
    else
      @first_throw_in_frame = true
      advance_frame
    end
  end

  def advance_frame
    @current_frame = [11 , @current_frame + 1].min
  end

  def adjust_frame_for_strike(pins)
    if pins == 10
      advance_frame
      true
    else
      false
    end
  end

end
