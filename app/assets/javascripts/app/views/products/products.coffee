App.Views.Products.Section = class Products extends Backbone.View
  tagName: "section"
  className: "stack"

  initialize: ->
    @collection   = new App.Collections.Products
    @index        = new App.Views.Products.Index.Main(stack: @, collection: @collection)
    @show         = new App.Views.Products.Show.Main(stack: @, collection: @collection)
    @controllers  = [@index, @show]

  render: ->
    @$el.append @index.render().el
    @$el.append @show.el
    @

  activate: (active_controller) ->
    controller.deactivate() for controller in @controllers when controller isnt active_controller
    active_controller.activate()

  # initialize: ->
  #   @list = new App.Views.Products.List
  #     collection: new App.Collections.Products()
  #   @detail = new App.Views.Products.Detail()

  # render: =>
  #   @$el.append @list.render().el
  #   @

  # show: (params) =>
  #   if item = Product.exists(params.id)
  #     # @active()
  #     @render(item)
  #   else
  #     Product.nextPage =>
  #       Product.one "refresh", =>
  #         @show(params)