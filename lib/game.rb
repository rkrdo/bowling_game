require 'scorer'

class Game

  def initialize
    @current_frame = 1
    @first_throw_in_frame = true
    @scorer = Scorer.new
  end

  def score
    score_for_frame(current_frame)
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
    if (strike(pins)) || !@first_throw_in_frame
      advance_frame
    else
      @first_throw_in_frame = false
    end
  end

  def strike(pins)
    @first_throw_in_frame && (pins == 10)
  end

  def advance_frame
    @current_frame = [10 , @current_frame + 1].min
  end

end
