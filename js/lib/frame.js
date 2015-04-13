var Frame = (function () {
  function Frame() {
    this.score = 0;
  };

  Frame.prototype = {
    constructor: Frame,

    getScore: function() {
      return this.score;
    },

    add: function(pins) {
      this.score += pins;
    }
  }

  return Frame;
}());

module.exports = Frame;
