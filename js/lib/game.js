class Game {
  constructor() {
    this.score = 0;
  }

  add(pins) {
    this.score += pins;
  }

}

module.exports = Game;
