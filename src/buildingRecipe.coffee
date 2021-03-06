class window.BuildingRecipe
  constructor: (@inItems, @outItems) ->
  
  #returns true if the given array contains the same items as @inItems
  matches: (items) ->
    inItems = @inItems.slice(0) # copy
    for item in items
      index = inItems.indexOf(item)
      if index >= 0
        inItems.splice(index, 1)
      else
        return false
    return inItems.length == 0
  
  outItems: ->
    @outItems
