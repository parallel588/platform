require([
  "app",
  "jquery", 
  "form", 
  "backbone", 
  "scrollTo",
  "waypoints",
  "modules/owlCarousel",
  "modules/productTemplate"
], function(app, $, FormModule, Backbone, ScrollTo, waypoints, OwlCarousel, ProductTemplate) {





  ////////////////////////////////////
  // Generic
  ////////////////////////////////////
  //Owl Carousel
  $(".js-owl-carousel").each(function() {
    new OwlCarousel({ el: $(this) });
  });

  // Scroll Helper
  $(".js-scroller").each(function() {
    var arrow = new ScrollTo({ el: $(this) });
  });

  // Change product template in farmers slide
  $(".js-product-template").each(function() {
    new ProductTemplate({ el: $(this) });
  });

  //Show in elements waypoint
  $(".js-show-in").each(function() {
    if (!$(this).hasClass("is-defered")) {
      var height = $(this).outerHeight();
      var offset = parseInt($(this).data("scrolloffset")) || 0;
      $(this).waypoint(function(direction) {
        if (direction === "down") {
          $(this).addClass("is-shown");
        }
      },{ 
        offset: (($.waypoints('viewportHeight') * 0.9) - offset)
      });
    }
  });




  ////////////////////////////////////
  // Slide Intro
  ////////////////////////////////////
  //Activate/deactivate kenburns images fx
  var $kenBurnsFX = $(".js-kenburns-fx");
  $kenBurnsFX.each(function() {
    var height = $(this).outerHeight();
    $(this).waypoint(function() {
      $(this).toggleClass("is-animated");
    },{
      offset: -$(".js-kenburns-fx").outerHeight()
    });
  });

  //Toggle hidden class in intro form
  $(".js-intro-form")
  .waypoint(function() {
    $(this).toggleClass("is-hidden");
  },{ 
    offset: -200
  });



});