class window.Item extends Phaser.Sprite
  constructor: (@gameType, state, game, x, y) ->
    if @gameType == "wood"
      key = "octocat"
    else if @gameType == "fruits"
      key = "octocat"
    else if @gameType == "stone"
      key = "octocat"
    else if @gameType == "iron"
      key = "black_cat"
    else if @gameType == "water"
      key = "black_cat"
    else if @gameType == "straw"
      key = "black_cat"
    else if @gameType == "wheat"
      key = "black_cat"
    else if @gameType == "egg"
      key = "black_cat"
    else if @gameType == "milk"
      key = "black_cat"
    else if @gameType == "steak"
      key = "black_cat"
    else if @gameType == "baby"
      key = "black_cat"
    else if @gameType == "worker"
      key = "black_cat"
    else if @gameType == "cookie"
      key = "black_cat"
    else if @gameType == "bread"
      key = "black_cat"
    else if @gameType == "iron ingots"
      key = "black_cat"

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
    else if @gameType == "iron ingots"
      @x += 1
      @y += 1
