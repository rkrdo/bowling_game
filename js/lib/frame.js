var Frame = (function () {
  function Frame() { };

  Frame.prototype = {
    constructor: Frame,
    getScore: function() {
      return 0;
    }
  }

  return Frame;
}());

module.exports = Frame;
