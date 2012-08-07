App.Views.Products.Index.List = class List extends Backbone.View
  
  initialize: ->
    @collection.on "reset", @addAll
    @collection.on "add", @addOne

  render: (store) ->
    @blankSlate(store)
    @collection.changeStore(store)
    @

  addAll: =>
    @addOne(item) for item in @collection.models
    @trigger "added", @collection.models

  addOne: (item) =>
    @$el.append(new App.Views.Products.Index.Item(model: item).render().el)
    @trigger "added", item

  blankSlate: (store) ->
    @$el.empty() # unbind existing DOM events
    @$el.append JST["app/templates/products/index/placcard"](store: store)