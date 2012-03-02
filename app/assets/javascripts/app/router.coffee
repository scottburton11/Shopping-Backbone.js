App.Router = class Router extends Backbone.Router
  routes:
    "products"     : "index"
    "products/:id" : "show"
    ":category"    : "index"
    ""             : "index"

  index: (params) ->
    App.main.products.index.show(params)

  show: (params) ->
    App.main.products.show.show(params)