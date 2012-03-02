window.categoryPath = (model) ->
  "/" + model.category.toLowerCase()

window.productsPath = (model) ->
  if model
    "/products/" + model.id
  else
    "/products"