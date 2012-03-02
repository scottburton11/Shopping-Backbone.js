App.Views.Products.Show.Main = class Main extends Backbone.View

  initialize: ->
    @stack = @options.stack
    
  render: (item) ->
    @detail.release() if @detail # watch out for memory leaks
    @detail = new App.Views.Products.Show.Detail(model: item)
    @$el.html @detail.render().el
    @

  activate: ->
    @$el.addClass("active")

  deactivate: ->
    @$el.removeClass("active")

  show: (id) ->
    if item = @collection.get(id)
      console.log "Found item", item
      @render item
      @stack.activate @
      @collection.off "add", @show, @
    else
      console.log "No item"
      @collection.on "add", @show, @
      @collection.nextPage()