define([
  "app",
  "backbone",
  "raphael",
  "underscore"
], function (app) {
  return CountdownTimer = Backbone.View.extend({
    
    circleRadius: 30,
    circleSize: 50,

    initialize: function () {
      //Set initial variables
      this.startingDate = this.$el.data("startingAt");
      this.endingDate = this.$el.data("endingAt");
      this.wholeDurationMinutes = this.getWholeDurationMinutes();
      this.remainingMinutes = this.getRemainingMinutes();
      //Create the SVG and animate to value
      this.createGraph();
      //Set repeating update function every 5 seconds
      this.checkTime();
      this.interval = setInterval(_.bind(this.checkTime, this), 5000)
    },

    getRemainingMinutes: function () {
      var endingDate = new Date(this.endingDate);
      var currentDate = new Date();
      return parseInt((endingDate - currentDate)/(60*1000), 10);
    },

    getWholeDurationMinutes: function () {
      var startingDate = new Date(this.startingDate);
      var endingDate = new Date(this.endingDate);
      return parseInt((endingDate - startingDate)/(60*1000), 10);
    },

    createGraph: function () {
      var canvas = Raphael(this.el, 0, 0, 100, 100);
      var circle = canvas.circle(50, 50, 40);
      circle.attr({
        "stroke": "#8CC63F",
        "stroke-width": 4
      });

      canvas.customAttributes.arc = function (xloc, yloc, value, total, R) {
        var alpha = 360 / total * value,
        a = (90 - alpha) * Math.PI / 180,
        x = xloc + R * Math.cos(a),
        y = yloc - R * Math.sin(a),
        path;
        if (total == value) {
          path = [
          ["M", xloc, yloc - R],
          ["A", R, R, 0, 1, 1, xloc - 0.01, yloc - R]
          ];
        } else {
          path = [
          ["M", xloc, yloc - R],
          ["A", R, R, 0, +(alpha > 180), 1, x, y]
          ];
        }
        return {
          path: path
        };
      };

      //make an arc at 50,50 with a radius of 30
      this.counterCircle = canvas.path().attr({
        "stroke": "white",
        "stroke-width": 35,
        arc: [this.circleSize, this.circleSize, this.wholeDurationMinutes, this.wholeDurationMinutes, this.circleRadius]
      });
    },

    animateToTime: function (timeMinutes) {
      var color = (timeMinutes < 60) ? "red" : "white";
      this.counterCircle.animate({
        "stroke": color,
        arc: [this.circleSize, this.circleSize, timeMinutes, this.wholeDurationMinutes, this.circleRadius]
      }, 1500, "bounce");
    },

    checkTime: function () {
      if (this.getRemainingMinutes() <= 0) {
        clearInterval(this.interval);
        this.hideForm();
      } else {
        this.animateToTime(this.getRemainingMinutes());
      }
    },

    hideForm: function () {
      $(".js-action-form").slideUp(app.animationDuration);
    }

  });
});