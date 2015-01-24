class window.Item extends Phaser.Sprite
  constructor: (@gameType, state, game, x, y) ->
    if @gameType == "wood"
      key = "wood"
    else if @gameType == "fruits"
      key = "wood"
    else if @gameType == "stone"
      key = "stone"
    else if @gameType == "iron"
      key = "wood"
    else if @gameType == "water"
      key = "wood"
    else if @gameType == "straw"
      key = "wood"
    else if @gameType == "wheat"
      key = "wood"
    else if @gameType == "egg"
      key = "wood"
    else if @gameType == "milk"
      key = "wood"
    else if @gameType == "steak"
      key = "steak"
    else if @gameType == "baby"
      key = "wood"
    else if @gameType == "worker"
      key = "wood"
    else if @gameType == "cookie"
      key = "wood"
    else if @gameType == "bread"
      key = "wood"
    else if @gameType == "iron ingots"
      key = "wood"

    super(game, x, y, key)

    state.gameTickEvent.add(@onGameTick, this)

    console.log("Item.constructor #{@gameType}")

  onGameTick: ->
    if @gameType == "wood"
      @x += 1
      @y += 1
    else if @gameType == "fruits"
      @x += 1
      @y += 1
    else if @gameType == "stone"
      @x += 1
      @y += 1
    else if @gameType == "iron"
      @x += 1
      @y += 1
    else if @gameType == "water"
      @x += 1
      @y += 1
    else if @gameType == "straw"
      @x += 1
      @y += 1
    else if @gameType == "wheat"
      @x += 1
      @y += 1
    else if @gameType == "egg"
      @x += 1
      @y += 1
    else if @gameType == "milk"
      @x += 1
      @y += 1
    else if @gameType == "steak"
      @x += 1
      @y += 1
    else if @gameType == "chicken"
      @x += 1
      @y += 1
    else if @gameType == "baby"
      @x += 1
      @y += 1
    else if @gameType == "worker"
      @x += 1
      @y += 1
    else if @gameType == "cookie"
      @x += 1
      @y += 1
    else if @gameType == "bread"
      @x += 1
      @y += 1
    else if @gameType == "iron_ingot"
      @x += 1
      @y += 1
