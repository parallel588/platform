require([
  "app",
  "jquery", 
  "backbone", 
  "waypoints",
  "rails_dependencies",
  "modules/countdown-timer"
], function(app, $) {

  // Initialize SVG counter in product page
  var CountdownTimer = require("modules/countdown-timer");
  $(".js-countdown-timer").each(function () {
    new CountdownTimer({ el: $(this) });
  });

  console.log("load app js");

});