App.Collections.Cart = class Cart extends Backbone.Collection

  totalPrice: ->
    cents = _.reduce @models, @sumPrice, 0

  sumPrice: (memo, model) ->
    memo + model.get("price_cents") 