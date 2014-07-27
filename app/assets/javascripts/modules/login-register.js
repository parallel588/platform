(function (win) {

  win.basketo.Modules.LoginRegister = Backbone.View.extend({

    events: { 
      "mouseover .js-login-register__form": "onFormMouseOverHandler"
    },

    initialize: function () {
    },

    onFormMouseOverHandler: function (event) {
      console.log($(event.currentTarget));
      this.$(".js-login-register__form").toggleClass("is-active", false);
      $(event.currentTarget).toggleClass("is-active", true);
    }

  });

})(window);