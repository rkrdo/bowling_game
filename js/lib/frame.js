class Frame {
  constructor() {
    this.score = 0;
  }

  getScore() {
    return this.score;
  }

  add(pins) {
    this.score += pins;
  }
}

module.exports = Frame;
