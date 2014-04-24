/*globals define*/
define(
  [],
  function() {
    var App = {};
    App.animationDuration = 500;
    App.querystrings = [];
    App.helpers = {};
    
    App.helpers.getQueryStrings = function() {
      var assoc  = {};
      var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
      var queryString = location.search.substring(1); 
      var keyValues = queryString.split('&'); 

      for (var i=0; i < keyValues.length; i++) {
        var key = keyValues[i].split('=');
        if (key.length > 1) {
          assoc[decode(key[0])] = decode(key[1]);
        }
      } 

      return assoc; 
    };

    App.helpers.clearClasses = function( $elem, classPrefix ) {
      var rx = new RegExp("^" + classPrefix + "| "),
          arrClasses = $.trim($elem.attr("class")).split(" "),
          newArr = [];
      $(arrClasses).each(function(i, arr){
        if ( !rx.test(arr) ) {
          newArr.push(arr);
        }
      });
      $elem.attr("class", newArr.join(" ") );
    };

    return App;
  }
);