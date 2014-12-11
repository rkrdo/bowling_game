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
    @throws[@current_throw += 1] = pins
    @score += pins
  end

  def score_for_frame(_frame)
    score = 0
    ball = 0
    _frame.times do |current_frame|
      first_throw = @throws[ball += 1]
      second_throw = @throws[ball +=1]
      score += (first_throw + second_throw)
    end
    score
  end

end
