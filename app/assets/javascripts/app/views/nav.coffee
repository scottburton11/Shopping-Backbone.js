App.Views.Nav = class Nav extends Backbone.View

  initialize: ->
    App.cart.on "add", @render, @
    super

  render: (items) ->
    @$("#items_in_cart").html "#{App.cart.length}"
    @