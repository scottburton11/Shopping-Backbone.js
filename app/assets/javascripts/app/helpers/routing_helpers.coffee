window.storePath = (model) ->
  "/" + model.store

window.productsPath = (model) ->
  if model
    "/products/" + model.id
  else
    "/products"