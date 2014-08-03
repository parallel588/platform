/* Common Dependecies */
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery_nested_form
//= require underscore
//= require backbone
//= require datetimepicker

//= require config/head
//= require config/app
//= require ./libs/jquery.plugin

//= require_tree ./libs
//= require_tree ./modules

(function( win, undefined ){

  // Global vars
  var $window = $(win), $body = $('body');
  var basketo = win.basketo, app = basketo.app;

  // Initialize SVG counter in product page
  $(".js-countdown-timer").each(function () {
    new basketo.Modules.CountdownTimer({ el: $(this) });
  });

  // Initialize Text counter next to the circle
  var countdownTimerText = basketo.Modules.CountdownTimerText;
  $(".js-countdown-timer-text").each(function () {
    var endingDate = new Date($(this).data("endingAt"));
    $(this).countdown({
      until: endingDate,
      compact: true,
      layout: '{dn}d {hnn}h{sep}{mnn}min{sep}{snn}"'
    });
  });

  // Initialize Image Gallery plugin, in product page
  $(".js-image-gallery").each(function () {
    new basketo.Modules.ImageGallery({ el: $(this) });
  });

  // Initialize Search Hero functionality, in home page
  $(".js-search-hero").each(function () {
    new basketo.Modules.SearchHero({ el: $(this) });
  });

  // Login-Register page
  $(".js-login-register").each(function () {
    new basketo.Modules.LoginRegister({ el: $(this) });
  });

  // Initidate datetimepicker plugin
  $(".js-datetimepicker").datetimepicker();


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

}(window));