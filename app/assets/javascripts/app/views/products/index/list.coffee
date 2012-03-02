App.Views.Products.Index.List = class List extends Backbone.View
  
  initialize: ->
    @collection.on "reset", @addAll
    @collection.on "add", @addOne

  render: (category) ->
    @blankSlate(category)
    @collection.changeCategory(category)
    @

  addAll: =>
    @addOne(item) for item in @collection.models
    @trigger "added", @collection.models

  addOne: (item) =>
    @$el.append(new App.Views.Products.Index.Item(model: item).render().el)
    @trigger "added", item

  blankSlate: (category) ->
    @$el.empty() # unbind existing DOM events
    @$el.append JST["app/templates/products/index/placcard"](category: category)