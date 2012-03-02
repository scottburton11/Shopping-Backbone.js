App.MainView = class Main extends Backbone.View

  initialize: ->
    @products = new App.Views.Products.Section

    @sections = [@products]


  render: ->
    @$el.append(section.render().el) for section in @sections
    @

