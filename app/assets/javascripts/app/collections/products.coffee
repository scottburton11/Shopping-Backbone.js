App.Collections.Products = class Products extends Backbone.Collection
  model: App.Models.Product
  url: "/products"
  next_page: 1
  per_page: 20
  category: "MEN"

  calculatePerPage: ->
    if @next_page is 1 then 19 else 20

  changeCategory: (category) ->
    @next_page = 1
    @category = category.toUpperCase()
    @nextPage(add: false)

  nextPage: (options) =>
    options = options or {}
    options = $.extend {}, {add: true}, options
    console.log "options", options
    @fetch
      data: 
        page:     @next_page
        per_page: @calculatePerPage()
        category: @category
      add: options.add

  parse: (data, xhr) ->
    @handlePaging(xhr)
    super data, xhr

  handlePaging: (xhr) ->
    paginationHeader = xhr.getResponseHeader("X-Pagination")
    for segment in paginationHeader.split(", ")
      do (segment) =>
        [key, value] = segment.split(": ")
        @[key] = parseInt(value)

  hasMorePages: ->
    @page < @total_pages


window.Products = App.Collections.Products