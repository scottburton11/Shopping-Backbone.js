App.Views.Products.Index.Item = class Item extends Backbone.View

  tagName: "article"
  className: "item product"

  events:
    "click" : "navigateToItem"

  initialize: ->
    @model.on "change", @render
    @model.on "remove", @remove

  render: =>
    @$el.html JST["app/templates/products/index/item"](@model.toJSON())
    @

  navigateToItem: (e) =>
    router.navigate "/products/#{@model.get('id')}",
      trigger: true
    e.preventDefault()

  remove: =>
    @$el.remove()