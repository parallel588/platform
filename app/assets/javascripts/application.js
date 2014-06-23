require([
  "app",
  "jquery", 
  "backbone", 
  "waypoints",
  "timecircles",
  "rails_dependencies"
], function(app, $) {

  $("#timecircle").TimeCircles({ 
    count_past_zero: false,
    circle_bg_color: "#8DBF44",
    fg_width: 0.2,
    bg_width: 0.1,
    direction: "counterClockwise",
    time: {
      Days: { show: false },
      Hours: { show: false },
      Minutes: { color: "white" },
      Seconds: { show: false }
    }
  });

  console.log("load app js");

});