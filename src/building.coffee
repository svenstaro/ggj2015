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
    
    input  = new Phaser.Graphics(@game, -64, 0)
    input.beginFill(0x00FF00, 0.5)
    input.drawRect(0, 0, 64, 64)
    input.endFill()
    this.addChild(input)
    output  = new Phaser.Graphics(@game, 64, 0)
    output.beginFill(0xFF0000, 0.5)
    output.drawRect(0, 0, 64, 64)
    output.endFill()
    this.addChild(output)

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
