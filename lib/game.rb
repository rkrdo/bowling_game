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
      @first_throw = @throws[@ball + 1]
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
    @second_throw = @throws[@ball + 2]
    frame_score = @first_throw + @second_throw
    if spare?
      @ball += 2
      score += frame_score + next_ball
    else
      @ball += 2
      score += frame_score
    end
  end

  def strike?
   @first_throw == 10
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

end
