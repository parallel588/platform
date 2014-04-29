requirejs.config({
  baseUrl: "/assets/",
  deps: ["application"],
  paths: {
    "app": "modules/app",
    "jquery": "bower_components/jquery/jquery",
    "underscore": "bower_components/underscore/underscore",
    "backbone": "bower_components/backbone/backbone",
    "backbone.wreqr": "bower_components/backbone.wreqr/lib/amd/backbone.wreqr",
    "skrollr": "libs/skrollr",
    "form": "modules/form",
    "scrollTo": "modules/scrollTo",
    "kenburns": "libs/kenburns",
    "waypoints": "libs/waypoints",
    "owl.carousel": "bower_components/OwlCarousel/owl-carousel/owl.carousel"
  }
});