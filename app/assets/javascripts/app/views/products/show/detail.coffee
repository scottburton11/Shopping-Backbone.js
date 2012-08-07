App.Views.Products.Show.Detail = class Detail extends Backbone.View

  events: 
    "click button": "addToCart"

  initialize: ->
    window.cart.collection.on "add", @handleButtonState
    
  render: =>
    @$el.html JST["app/templates/products/show/detail"](@model.viewAttributes())
    @handleButtonState()
    @

  addToCart: (e) =>
    window.cart.collection.add @model

  handleButtonState: =>
    if window.cart.collection.get @model.id
      @$("button").attr "disabled", "disabled"
      @$("button").addClass "disabled"
    else
      @$("button").removeAttr "disabled"
      @$("button").removeClass "disabled"


  release: ->
    window.cart.collection.off "add", @handleButtonState
    @remove()