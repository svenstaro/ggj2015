class window.Item extends Phaser.Sprite
  constructor: (@gameType, state, game, x, y) ->
    if @gameType == "wood"
      key = "wood"
    else if @gameType == "fruits"
      key = "fruits"
    else if @gameType == "stone"
      key = "stone"
    else if @gameType == "water"
      key = "water"
    else if @gameType == "straw"
      key = "straw"
    else if @gameType == "wheat"
      key = "wheat"
    else if @gameType == "egg"
      key = "egg"
    else if @gameType == "worker"
      key = "worker"
    else if @gameType == "chicken"
      key = "chicken"

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
    else if @gameType == "chicken"
      @x += 1
      @y += 1
    else if @gameType == "worker"
      @x += 1
      @y += 1
