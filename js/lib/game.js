class Game {
  constructor() {
    this._itsScore = 0;
    this._itsThrows = new Array(21);
    this._itsCurrentThrow = 0;
  }

  get score() {
    return this._itsScore;
  }

  add(pins) {
    this._itsThrows[this._itsCurrentThrow++] = pins;
    this._itsScore += pins;
  }

  scoreForFrame(frame) {
    let score = 0;
    for(let ball = 0; frame > 0 && ( ball < this._itsCurrentThrow); ball +=2, frame--) {
      score += this._itsThrows[ball] + this._itsThrows[ball + 1];
    }
    return score;
  }

}

module.exports = Game;
