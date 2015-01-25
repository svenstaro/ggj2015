class window.Building extends Phaser.Sprite
  constructor: (@gameType, state, game, x, y) ->
    key = @gameType
    @cooldown = 5
    
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
    else if @gameType == "hut"
      @recipes = [
        new BuildingRecipe(["food", "water"], ["baby"])
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
    if @cooldown == 0
      console.log(items)
      @cooldown = 10
    else
      @cooldown -= 1
