class window.Building extends Phaser.Sprite
  constructor: (@gameType, state, game, x, y) ->
    if @gameType == "well"
      key = "octocat"
      @recipes = [
        new BuildingRecipe([], ["water"])
      ]
    else if @gameType == "wheat_farm"
      key = "wheat_farm"
      @recipes = [
        new BuildingRecipe(["water"], ["straw", "wheat"])
      ]
    else if @gameType == "chicken_farm"
      key = "octocat"
      @recipes = [
        new BuildingRecipe(["fruits"], ["egg"]),
        new BuildingRecipe(["straw"], ["chicken"])
      ]
    else if @gameType == "cow_farm"
      key = "octocat"
      @recipes = [
        new BuildingRecipe(["water"], ["milk"])
        new BuildingRecipe(["straw"], ["steak"])
      ]
    else if @gameType == "hut"
      key = "black_cat"
      @recipes = [
        new BuildingRecipe(["food", "water"], ["baby"])
      ]
    else if @gameType == "storage"
      key = "black_cat"
      @recipes = []
    else if @gameType == "bakery"
      key = "black_cat"
      @recipes = [
        new BuildingRecipe(["wheat", "egg", "wood", "milk", "fruit"], ["cookie"]),
        new BuildingRecipe(["wheat", "egg", "wood", "water"], ["bread"])
      ]
    else if @gameType == "refinery"
      key = "black_cat"
      @recipes = [
        new BuildingRecipe(["iron", "wood"], ["iron ingots"])
      ]

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
