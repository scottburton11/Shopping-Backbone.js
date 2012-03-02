//= require lib/underscore-min
//= require lib/backbone
//= require_tree ./lib

//= require app/app

//= require_tree ./app/models
//= require_tree ./app/collections
//= require_tree ./app/views
//= require_tree ./app/templates
//= require_tree ./app/helpers

//= require ./app/router
//= require ./app/main


$ ->
  App.main = new App.MainView
  App.main.setElement($("#main"))
  App.main.render()

  App.cart   = new App.Collections.Cart
  App.nav    = new App.Views.Nav(el: $(".nav"))
  App.router = new App.Router

  window.cart    = App.cart
  window.router  = App.router
  window.main    = App.main

  Backbone.history.start({pushState: true})

  $('body').on "click", "a.navigable", (e) ->
    router.navigate e.currentTarget.pathname, 
      trigger: true
    e.preventDefault()