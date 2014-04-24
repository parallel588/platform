define([
  "backbone",
  "owl.carousel"
], function(Backbone){

  return OwlCarousel = Backbone.View.extend({

    events: {
      "click .js-owl-carousel__next": "nextOwlSlide",
      "click .js-choose-product": "updateProductOnNextSlide",
    },

    owl: {},

    initialize: function(){

      this.owl = this.$el.owlCarousel({
        singleItem: true,
        rewindNav : false,
        mouseDrag : false,
        touchDrag : false,
        afterMove : function(element) {
          var $current = $(element).find(".owl-item").eq(this.currentItem);
          var $showIn = $current.find(".js-show-in");
          if ($showIn.length > 0) {
            $showIn.addClass("is-shown");
          }
        }
      });

    },

    nextOwlSlide: function() {
      this.owl.trigger('owl.next');
    },

    updateProductOnNextSlide: function(event) {
      var $clicked = $(event.currentTarget);
      var $target = $($clicked.data("target"), $clicked.parents(".owl-carousel"));
      var data = $.parseJSON($clicked.attr("data-info"));
      var $title = $target.find(".js-slide-intro-detailed-product__title");
      var $icon = $target.find(".js-slide-intro-detailed-product__icon");
      $title.html(data.title);
      $icon.addClass("o-yummicon--" + data.icon);
      //Show the offers in the next slide
      var $offers = $target.siblings(".m-showcase__item--offer");
      if ($offers.length > 0) {
        var step = 500;
        $offers.each(function(index, element) {
          setTimeout(function() {
            $(element).addClass("is-shown");
          }, step*index + 1000);
        });
      }
    }


  });

});