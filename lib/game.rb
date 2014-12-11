class Game

  def initialize
    @score = 0
  end

  def score
    @score
  end

  def add(pins)
    @score += pins
  end

  def score_for_frame(frame)
    0
  end
end
