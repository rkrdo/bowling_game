class Scorer

  def initialize
    @throws = Array.new(21) { 0 }
    @current_throw = 0
  end

  def add_throw(pins)
    @throws[@current_throw += 1] = pins
  end

  def score_for_frame(the_frame)
    score = 0
    @ball = 0
    the_frame.times do |current_frame|
      if strike?
        score += 10 + next_two_balls_for_strike
        @ball += 1
      elsif spare?
        score += 10 + next_ball_for_spare
        @ball += 2
      else
        score += two_balls_in_frame
        @ball += 2
      end
    end
    score
  end

  private

  def strike?
   @throws[@ball + 1] == 10
  end

  def spare?
    (@throws[@ball + 1] + @throws[@ball + 2]) == 10
  end

  def next_two_balls_for_strike
    (@throws[@ball + 2] + @throws[@ball + 3])
  end

  def next_ball_for_spare
    @throws[@ball + 3]
  end

  def two_balls_in_frame
    @throws[@ball + 1] + @throws[@ball + 2]
  end

end
