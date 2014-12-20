require 'scorer'

class Game

  def initialize
    @score = 0
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
    @score += pins
    adjust_current_frame(pins)
  end

  def score_for_frame(the_frame)
    @scorer.score_for_frame the_frame
  end

  private

  def adjust_current_frame(pins)
    if @first_throw_in_frame
      if pins == 10
        @current_frame += 1
      else
        @first_throw_in_frame = false
      end
    else
      @first_throw_in_frame = true
      @current_frame += 1
    end
    @current_frame = [11 , @current_frame].min
  end

end
