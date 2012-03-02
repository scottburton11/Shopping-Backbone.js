App.Views.Products.Show.Detail = class Detail extends Backbone.View

  events: 
    "click button": "addToCart"

  initialize: ->
    window.cart.on "add", @handleButtonState
    
  render: ->
    @$el.html JST["app/templates/products/show/detail"](@model.toJSON())
    @handleButtonState()
    @

  addToCart: (e) =>
    window.cart.add @model

  handleButtonState: =>
    if window.cart.get @model.id
      @$("button").attr "disabled", "disabled"
      @$("button").addClass "disabled"
    else
      @$("button").removeAttr "disabled"
      @$("button").removeClass "disabled"


  release: ->
    window.cart.off "add", @handleButtonState
    @remove()