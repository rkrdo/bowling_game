class Game

  def initialize
    @score = 0
    @throws = Array.new(21) { 0 }
    @current_throw = 0
    @current_frame = 1
    @first_throw_in_frame = true
  end

  def score
    score_for_frame(current_frame - 1)
  end

  def current_frame
    @current_frame
  end

  def add(pins)
    @throws[@current_throw += 1] = pins
    @score += pins
    adjust_current_frame(pins)
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
