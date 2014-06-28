require([
  "app",
  "jquery", 
  "backbone", 
  "waypoints",
  // "rails_dependencies",
  "modules/countdown-timer",
  "modules/image-gallery"
], function(app, $) {

  // Initialize SVG counter in product page
  var CountdownTimer = require("modules/countdown-timer");
  $(".js-countdown-timer").each(function () {
    new CountdownTimer({ el: $(this) });
  });

  // Initialize Image Gallery plugin, in product page
  var ImageGallery = require("modules/image-gallery");
  $(".js-image-gallery").each(function () {
    new ImageGallery({ el: $(this) });
  });

  console.log("load app js");

});