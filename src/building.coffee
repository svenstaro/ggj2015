class window.Building extends Phaser.Sprite
  constructor: (@gameType, state, game, x, y) ->
    key = @gameType
    
    if @gameType == "well"
      @recipes = [
        new BuildingRecipe([], ["water"])
      ]
    else if @gameType == "wheat_farm"
      @recipes = [
        new BuildingRecipe(["water"], ["straw", "wheat"])
      ]
    else if @gameType == "chicken_farm"
      @recipes = [
        new BuildingRecipe(["fruits"], ["egg"]),
        new BuildingRecipe(["straw"], ["chicken"])
      ]
    else if @gameType == "cow_farm"
      @recipes = [
        new BuildingRecipe(["water"], ["milk"])
        new BuildingRecipe(["straw"], ["steak"])
      ]
    else if @gameType == "hut"
      @recipes = [
        new BuildingRecipe(["food", "water"], ["baby"])
      ]
    else if @gameType == "storage"
      @recipes = []
    else if @gameType == "bakery"
      @recipes = [
        new BuildingRecipe(["wheat", "egg", "wood", "milk", "fruit"], ["cookie"]),
        new BuildingRecipe(["wheat", "egg", "wood", "water"], ["bread"])
      ]
    else if @gameType == "refinery"
      @recipes = [
        new BuildingRecipe(["iron", "wood"], ["iron ingots"])
      ]
    else if @gameType == "path"
      @recipes = []

    super(game, x, y, key)

    state.gameTickEvent.add(@onGameTick, this)

    console.log("Building.constructor #{@gameType}")

  onGameTick: ->
    @itemsIn([])
    
  itemsIn: (items) ->
    for recipe in @recipes
      if recipe.matches(items)
        @itemsOut(recipe.outItems)
    
  itemsOut: (items) ->
    #console.log(items)
