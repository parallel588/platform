//= require raphael

(function (win) { 

  win.basketo.Modules.CountdownBar = Backbone.View.extend({

    initialize: function () {
      //Set initial variables
      this.startingDate = this.$el.data("startingAt");
      this.endingDate = this.$el.data("endingAt");
      this.wholeDurationMinutes = this.getWholeDurationMinutes();
      //Set width of bar
      this.setBarWidth();
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

    setBarWidth: function () {
      var totalWidth = this.$el.width();
      var barWidth = parseInt((totalWidth * this.getRemainingMinutes())/this.wholeDurationMinutes, 10);
      console.log(this.getRemainingMinutes());
      if ((barWidth+ 20) >= totalWidth) {
        barWidth = totalWidth - 40;
      }
      console.log(barWidth);
      this.$(".js-countdown__bar").width(barWidth).toggleClass("m-countdown__bar--ending", (barWidth<50));
    },

    checkTime: function () {
      if (this.getRemainingMinutes() <= 0) {
        clearInterval(this.interval);
        this.hideForm();
      } else {
        this.setBarWidth();
      }
    },

    hideForm: function () {
      $(".js-action-form").slideUp(app.animationDuration);
    }
  
  });

})(window);