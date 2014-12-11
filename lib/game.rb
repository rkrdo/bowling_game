class Game

  def initialize
    @score = 0
    @throws = Array.new(21)
    @current_throw = 0
  end

  def score
    @score
  end

  def add(pins)
    @throws[@current_throw] = pins
    @current_throw += 1
    @score += pins
  end

  def score_for_frame(_frame)
    score = 0
    ball = 0
    while _frame > 0 && (ball < @current_throw) do
      score += @throws[ball] + @throws[ball + 1]
      ball += 2
      _frame -= 1
    end
    score
  end
end
