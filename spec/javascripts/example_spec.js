/*

Use AsyncSpecs for good requirejs testings. yay.

*/
(function () {
  describe("Basic Application Functionality", function () {
    var async = new AsyncSpec(this);
    async.beforeEach(function (done) {
      // load needed modules, then return done();
      // NOTE: ALWAYS user absolute /assets/ path, not assets/, when requiring config files.
      require(['/assets/application.config'], function () {
        done();
      });
    });
    async.it("Application should exist", function (done) {
      // do your tests, then call done();
      require(['app'], function () {
        var App = require('app');
        expect(App).toBeDefined();
        done();
      });
    });
    async.afterEach(function (done) {
      done();
    });
  });

})();