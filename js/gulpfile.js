/*  https://github.com/gulpjs/gulp/blob/master/docs/recipes/mocha-test-runner-with-gulp.md */

var gulp = require('gulp'),
  babel = require('babel/register'),
  mocha = require('gulp-mocha');

gulp.task('mocha', function() {
  return gulp.src(['test/*.js'], { read: false })
  .pipe(mocha({
    reporter: 'spec'
  }));
});

gulp.task('watch-mocha', function() {
  gulp.watch(['lib/**', 'test/**'], ['mocha']);
});

gulp.task('default', ['mocha', 'watch-mocha']);
