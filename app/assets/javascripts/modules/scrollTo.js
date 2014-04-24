define([ 
  "app",
  "jquery", 
  "backbone" 
  ],
  function (app, $, Backbone) {
    return ScrollTo = Backbone.View.extend({
      events: {
        "click": "clickHandler"
      },
      clickHandler: function(event) {
        if (( event && event.preventDefault ) && ( this.$el.attr("href") !== this.$el.data("target") )) {
          event.preventDefault();
        }
        var $target = $( this.$el.data("target") ).eq(0),
            YPos = 0,
            centerOffset = Math.max(($(window).height() - $target.outerHeight()) / 2, 0),
            declaredOffset = parseInt(this.$el.data("offset"), 10);
        if ( this.$el.data("center-target") ) {
          YPos = $target.offset().top - centerOffset;
        } else if ( declaredOffset ) {
          YPos = $target.offset().top + declaredOffset;
        } else {
          YPos = $target.offset().top;
        }
        //Scroll
        $("html, body").animate({
          scrollTop: YPos
        }, app.animationDuration);
      }
    });
  }
);