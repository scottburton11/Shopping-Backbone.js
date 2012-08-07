App.Views.Cart = class Cart extends Backbone.View

  initialize: ->
    @collection = new App.Collections.Cart
    @collection.on "add", @render, @
    super

  render: () ->
    @$el.html JST["app/templates/cart"]({items: @items(), totalPrice: @totalPrice()})
    @

  items: ->
    if @collection.length > 0
      length = @collection.length
      if @collection.length > 1
        "#{length} items"
      else
        "#{length} item"

  totalPrice: ->
    if @collection.length > 0
      "$" + @collection.totalPrice()/100