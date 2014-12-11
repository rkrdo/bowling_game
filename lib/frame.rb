class Frame

  def initialize
    @score = 0
  end

  def get_score
    @score
  end

  def add(pins)
    @score += pins
  end
end
