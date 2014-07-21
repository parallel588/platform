(function (win) {

  win.basketo.Modules.SearchHero = Backbone.View.extend({

    events: { 
      "keyup .js-search-hero__main-search": "onSearchFocusHandler"
    },

    onSearchFocusHandler: function () {
      this.showAllFields();
    },

    showAllFields: function () {
      this.$el.addClass("is-active");
    }

  });

})(window);