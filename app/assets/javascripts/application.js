require([
  "app",
  "jquery",
  "backbone",
  "waypoints",
  'jquery_nested_form',
  'libs/jquery.color',
  'libs/jquery.Jcrop',
  "rails_dependencies",
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

  $(function(){
      if ($('#product-image-crop').length > 0) {
          var updateCoordinates =  function(c) {
              var ratio = 1;

              $("#crop_x").val(Math.round(c.x * ratio));
              $("#crop_y").val(Math.round(c.y * ratio));
              $("#crop_w").val(Math.round(c.w * ratio));
              $("#crop_h").val(Math.round(c.h * ratio));
          }

          $('#product-image-crop').Jcrop({keySupport: false, onSelect: updateCoordinates, minSize: [100, 100]});
      }
  })
});
