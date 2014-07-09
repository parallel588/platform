(function(win, undefined){

  var App = function () {
    // Constants
    this.modernBrowser = ('querySelector' in document && 'localStorage' in window && 'addEventListener' in window);
    this.animationDuration = 150;
    this.scrollDuration = 500;
    this.animationDuration = 150;
    this.lazyOffset = 500;
    this.querystrings = [];
    this.user = {};
    this.user.id = (typeof current_user_id === 'undefined')? 0 : current_user_id;
    this.user.likes = false;
    this.user.isGettingLikes = false; //is true during ajax load to throttle consequent ajax calls in multiple like button views
    this.helpers = new Helpers();
  }
  App.prototype.isIE10orHigher = function () {
    // I'm so sorry
    var rv = -1;
    var ua;
    var re;
    if (navigator.appName == 'Microsoft Internet Explorer') {
      ua = navigator.userAgent;
      re  = new RegExp("MSIE ([0-9]{1,}[.0-9]{0,})");
      if (re.exec(ua) != null){
        rv = parseFloat( RegExp.$1 );
      }
    } else if (navigator.appName == 'Netscape') {
      ua = navigator.userAgent;
      re  = new RegExp("Trident/.*rv:([0-9]{1,}[.0-9]{0,})");
      if (re.exec(ua) != null){
        rv = parseFloat( RegExp.$1 );
      }
    }
    // Check version number (return true if greater than or equal to 10, otherwise false)
    return (rv >= 10);
    // If you need to return the version number use this
    //return rv;
  };

  App.prototype.setEndOfContenteditable = function(contentEditableElement) {
    var range,selection;
    if(document.createRange)//Firefox, Chrome, Opera, Safari, IE 9+
    {
        range = document.createRange();//Create a range (a range is a like the selection but invisible)
        range.selectNodeContents(contentEditableElement);//Select the entire contents of the element with the range
        range.collapse(false);//collapse the range to the end point. false means collapse to end rather than the start
        selection = window.getSelection();//get the selection object (allows you to change selection)
        selection.removeAllRanges();//remove any selections already made
        selection.addRange(range);//make the range you have just created the visible selection
    }
    else if(document.selection)//IE 8 and lower
    { 
        range = document.body.createTextRange();//Create a range (a range is a like the selection but invisible)
        range.moveToElementText(contentEditableElement);//Select the entire contents of the element with the range
        range.collapse(false);//collapse the range to the end point. false means collapse to end rather than the start
        range.select();//Select the range (make it the visible selection
    }
  };

  //IE8 indexOf support
  if (!Array.prototype.indexOf) {
    Array.prototype.indexOf = function(elt /*, from*/) {
      var len = this.length >>> 0;
      var from = Number(arguments[1]) || 0;
      from = (from < 0) ? Math.ceil(from) : Math.floor(from);
      if (from < 0) {
        from += len;
      }
      for (; from < len; from++) {
        if (from in this && this[from] === elt) {
          return from;
        }
      }
      return -1;
    };
  }

  App.prototype.hasLoaded = function(){
    $("body").removeClass("is-loading");
  };

  var Helpers = function () {};

  Helpers.prototype.vwRefresh = function($elems){
    if ( Modernizr.cssvwunit ) {
      $elems.each(function(){
        $(this).css("z-index", "1");
      });
    }
  };

  Helpers.prototype.fullHeightRefresh = function($elems){
    $elems.each(function(){
      $(this).css("height", "auto")
             .css("min-height", $(window).height());
    });
  };

  Helpers.prototype.clearClasses = function( $elem, classPrefix ) {
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

  Helpers.prototype.removeQuotes = function(string) {
    if (typeof string === 'string' || string instanceof String) {
      string = string.replace(/^['"]+|\s+|\\|(;\s?})+|['"]$/g, '');
    }
    return string;
  };

  Helpers.prototype.getPseudoContent = function( elem, pseudoElem ){
    return window.getComputedStyle(elem, pseudoElem).content;
  };

  Helpers.prototype.updateQueryStringParameter = function(uri, key, value) {
    var re = new RegExp("([?|&])" + key + "=.*?(&|$)", "i");
    separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
      return uri.replace(re, '$1' + key + "=" + value + '$2');
    }
    else {
      return uri + separator + key + "=" + value;
    }
  };

  Helpers.prototype.getQueryStrings = function() {
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

  Helpers.prototype.setTransform = function(element, transform) {
    if (element instanceof jQuery) {
      element = element[0];
    }
    element.style.webkitTransform = transform;
    element.style.MozTransform = transform;
    element.style.msTransform = transform;
    element.style.OTransform = transform;
    element.style.transform = transform;
  };

  var app = new App();
  window.basketo.app =  app;
  
}(window));