var assert = require("chai").assert;
var Game = require('../lib/game');

describe('Game', function() {
  describe('test one throw', function() {
    it('returns the correct score', function() {
      let g = new Game();
      g.add(5);
      assert.equal(5, g.score);
    });
  });

  describe('test two throws', function() {
    it('returns the correct score', function() {
      let g = new Game();
      g.add(5);
      g.add(4);
      assert.equal(9, g.score);
    });
  });

  describe('test four throws', function() {
    it('returns the correct score for a frame', function() {
      let g = new Game();
      g.add(5);
      g.add(4);
      g.add(7);
      g.add(2);
      assert.equal(18, g.score);
      assert.equal(9, g.scoreForFrame(1));
      assert.equal(18, g.scoreForFrame(2));
    });
  });
});
