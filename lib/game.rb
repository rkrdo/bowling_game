class Game

  def initialize
    @score = 0
    @throws = Array.new(21) { 0 }
    @current_throw = 0
    @current_frame = 1
    @first_throw = true
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
    ball = 0
    the_frame.times do |current_frame|
      first_throw = @throws[ball += 1]
      if first_throw == 10
        score += 10 + (@throws[ball + 1] + @throws[ball + 2])
      else
        second_throw = @throws[ball +=1]
        frame_score = first_throw + second_throw
        if frame_score == 10
          score += frame_score + @throws[ball + 1]
        else
          score += frame_score
        end
      end
    end
    score
  end

  private

  def adjust_current_frame(pins)
    if @first_throw
      if pins == 10
        @current_frame += 1
      else
        @first_throw = false
      end
    else
      @first_throw = true
      @current_frame += 1
    end
    @current_frame = [11 , @current_frame].min
  end

end
