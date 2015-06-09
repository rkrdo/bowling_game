var assert = require("chai").assert;
var Game = require('../lib/game');

describe('Game', function() {
  describe('test one throw', function() {
    it('returns the correct score', function() {
      var g = new Game();
      g.add(5);
      assert.equal(5, g.score);
    });
  });
});
