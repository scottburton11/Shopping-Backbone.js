App.Models.Product = class Product extends Backbone.Model

  descriptionItems: ->
    @get("description").split(/\s\s/)

  viewAttributes: ->
    _.extend {}, @toJSON(), @computedProperties()

  computedProperties: ->
    {
      descriptionItems: @descriptionItems()
    }

window.Product = App.Models.Product