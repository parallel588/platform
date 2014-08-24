(function (win) { 

  win.basketo.Modules.Checkout = Backbone.View.extend({

    events: {
      "change .js-checkout__toggle-addresses": "onAddressSelectToggle"
    },

    initialize: function () {
      this.toggleAddresses(this.$(".js-checkout__toggle-addresses").val());
    },

    onAddressSelectToggle: function (event) {
      var $target = $(event.currentTarget);
      var address = $target.val();
      this.toggleAddresses(address);
    },

    toggleAddresses: function (address) {
      this.$(".js-checkout__shipping-address").hide();
      this.$(".js-checkout__shipping-address--" + address).show();
    }
  
  });

})(window);