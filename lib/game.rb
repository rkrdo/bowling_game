class Game

  def initialize
    @score = 0
    @throws = Array.new(21) { 0 }
    @current_throw = 0
    @current_frame = 1
    @first_throw = true
  end

  def score
    @score
  end

  def current_frame
    @current_frame
  end

  def add(pins)
    @throws[@current_throw += 1] = pins
    @score += pins
    adjust_current_frame
  end

  def score_for_frame(the_frame)
    score = 0
    ball = 0
    the_frame.times do |current_frame|
      first_throw = @throws[ball += 1]
      second_throw = @throws[ball +=1]
      frame_score = first_throw + second_throw
      if frame_score == 10
        score += frame_score + @throws[ball + 1]
      else
        score += frame_score
      end
    end
    score
  end

  private

  def adjust_current_frame
    if @first_throw
      @first_throw = false
    else
      @first_throw = true
      @current_frame += 1
    end
  end

end
