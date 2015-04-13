var assert = require("chai").assert;
var Frame = require('../lib/frame');

describe('Frame', function() {
  describe('score for no throws', function() {
    it('should return 0', function() {
      var f = new Frame();
      assert.equal(0, f.getScore());
    });
  })
});
