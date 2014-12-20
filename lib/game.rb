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
        @ball += 1
        score += 10 + next_two_balls
      else
        score += handle_second_throw
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

  def handle_second_throw
    score = 0
    if spare?
      @ball += 2
      score += (10 + next_ball)
    else
      score += two_balls_in_frame
      @ball += 2
    end
    score
  end

  def strike?
   @throws[@ball + 1] == 10
  end

  def spare?
    (@throws[@ball + 1] + @throws[@ball + 2]) == 10
  end

  def next_two_balls
    (@throws[@ball + 1] + @throws[@ball + 2])
  end

  def next_ball
    @throws[@ball + 1]
  end

  def two_balls_in_frame
    @throws[@ball + 1] + @throws[@ball + 2]
  end

end
