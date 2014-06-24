define([
  "app",
  "backbone",
  "raphael"
], function (app) {
  return CountdownTimer = Backbone.View.extend({
    events: {
    },
    initialize: function () {

      this.startingDate = this.$el.data("startingAt");
      this.endingDate = this.$el.data("endingAt");
      this.wholeDurationMinutes = this.getWholeDurationMinutes();
      this.remainingMinutes = this.getRemainingMinutes();
      console.log(this.wholeDurationMinutes, this.remainingMinutes);

      //Get Time
      //Create Graph (Time)
      //Set repeating function
        //Get Time
        //Update Graph (Time)
          //If done: 
            //Cancel timer
            //close form


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

      //make an arc at 50,50 with a radius of 30 that grows from 0 to 40 of 100 with a bounce
      var my_arc = canvas.path().attr({
        "stroke": "white",
        "stroke-width": 35,
        arc: [50, 50, this.wholeDurationMinutes, this.wholeDurationMinutes, 30]
      });

      my_arc.animate({
        arc: [50, 50, this.remainingMinutes, this.wholeDurationMinutes, 30]
      }, 1500, "bounce");

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
    }

  });
});