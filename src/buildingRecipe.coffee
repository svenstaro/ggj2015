class window.BuildingRecipe
  constructor: (@inItems, @outItems) ->
  
  matches: (items) ->
    inItems = @inItems.slice(0)
    for item in items
      index = inItems.indexOf(item)
      if index >= 0
        inItems.splice(index, 1)
      else
        return false
    return inItems.length == 0
  
  outItems: ->
    @outItems