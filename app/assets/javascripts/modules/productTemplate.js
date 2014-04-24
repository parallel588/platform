define([
  "app",
  "backbone"
], function(app, Backbone){

  return ProductTemplate = Backbone.View.extend({

    events: {
      "click .js-change-template": "changeTemplate"
    },

    products: [
      {
        title: "Lemons",
        icon: "lemon",
        location: "====",
        volume: "===",
        price: "======="
      },
      {
        title: "Pears",
        icon: "pear",
        origin: "===",
        volume: "======",
        price: "===="
      },
      {
        title: "Oranges",
        icon: "orange",
        origin: "======",
        volume: "======",
        price: "========="
      },
      {
        title: "Tomatos",
        icon: "tomato",
        origin: "====",
        volume: "========",
        price: "===="
      }
    ],

    currentIndex: 0,

    changeTemplate: function(event) {
      var $clicked = $(event.currentTarget);
      if ($clicked.hasClass("js-change-template--prev")) {
        this.reduceCurrentIndex();
      } else if ($clicked.hasClass("js-change-template--next")) {
        this.increaseCurrentIndex();
      }
      this.updateTemplate();
    },

    reduceCurrentIndex: function() {
      this.currentIndex--;
      if (this.currentIndex < 0) {
        this.currentIndex = this.products.length-1;
      }
    },

    increaseCurrentIndex: function() {
      this.currentIndex++;
      if (this.currentIndex > this.products.length-1) {
        this.currentIndex = 0;
      }
    },

    updateTemplate: function() {
      var data = this.products[this.currentIndex];
      var $title = this.$(".js-product-title");
      var $icon = this.$(".js-product-icon");
      var $volume = this.$(".js-product-volue");
      var $origin = this.$(".js-product-origin");
      var $price = this.$(".js-product-price");
      var $nextProdData = this.$(".js-choose-product").data("info");
      $title.html(data.title);
      app.helpers.clearClasses($icon, "o-yummicon--");
      $icon.addClass("o-yummicon--" + data.icon);
      $volume.html(data.volume + "kg");
      $origin.html(data.origin);
      $price.html(data.price);
      //Update the data info for the next slide selected product
      this.$(".js-choose-product").attr("data-info", '{"title": "' + data.title + '", "icon": "' + data.icon + '"}')
    }

  });

});