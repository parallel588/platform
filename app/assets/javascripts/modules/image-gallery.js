define([
  "app",
  "backbone",
  "owlCarousel"
], function (app) {
  return ImageGallery = Backbone.View.extend({

    events: { 
      "click .js-image-gallery__thumbnail": "onThumbnailClickHandler"
    },

    initialize: function () {
      this.initOwlCarousel();
    },

    onThumbnailClickHandler: function (event) {
      this.toggleActive(event);
      this.updateMain(event);
    },

    initOwlCarousel: function () {
      // Init Owl Carousel, product page pictures
      this.$(".js-image-gallery__owl").owlCarousel({
        navigation: true,
        pagination: false,
        rewindNav: false
      });
    },

    toggleActive: function (event) {
      var $target = $(event.currentTarget);
      this.$(".js-image-gallery__thumbnail.is-active").toggleClass("is-active", false);
      $target.toggleClass("is-active", true);
    },

    updateMain: function (event) {
      var $target = $(event.currentTarget);
      var $main = this.$(".js-image-gallery__main");
      var mainImageSrc = $target.data("image");
      var mainTargetSrc = $target.data("target");
      $main.attr("href", mainTargetSrc);
      $main.find("img").attr("src", mainImageSrc);
    }


  });
});