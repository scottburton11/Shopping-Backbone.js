App.Views.Products.Index.Main = class Main extends Backbone.View

  initialize: ->
    @stack = @options.stack

  render: ->
    @$el.html JST["app/templates/products/index/list"]()
    @list = new App.Views.Products.Index.List(collection: @collection, el: @$(".list"))
    @list.bind "added", @setupWaypoint
    @

  activate: ->
    @$el.addClass("active")

  deactivate: ->
    @$el.removeClass("active")

  show: (category) =>
    category = category or "MEN"
    unless @category is category
      @category = category
      @list.render(@category)
    @stack.activate @

  setupWaypoint: =>
    if @collection.hasMorePages() then @rebindWaypoint() else @unbindWaypoint()

  rebindWaypoint: =>
    if $.waypoints().length is 0 
      @bindWaypoint() 
    else 
      $.waypoints("refresh")

  bindWaypoint: =>
    @$(".waypoint").waypoint @waypointReached,
      offset: "99%",
      onlyOnScroll: true

  unbindWaypoint: =>
    @waypoint.waypoint("destroy")

  waypointReached: (event, direction) =>
    @collection.nextPage() if direction is "down"
