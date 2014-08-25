(function (win) {

  win.basketo.Modules.Flash = Backbone.View.extend({

    events: { 
      "click": "onClickHandler"
    },

    initialize: function () {
      var that = this;
      this.show();
      setTimeout(function () {
        that.hide();
      }, 5000);
    },

    onClickHandler: function () {
      this.hide();
    },

    show: function () {
      this.$el.slideDown(250);
    },

    hide: function () {
      this.$el.slideUp(250);
    }

  });

})(window);