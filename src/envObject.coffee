class window.EnvObject extends Phaser.Sprite
  constructor: (@gameType, state, @game, x, y) ->
    if @gameType == "tree"
      @key = "octocat"
    else if @gameType == "stone"
      @key = "octocat"
    else if @gameType == "iron"
      @key = "octocat"
    else if @gameType == "fruits"
      @key = "black_cat"

    super(@game, x, y, @key)

    state.gameTickEvent.add(@onGameTick, this)

    console.log("EnvObject.constructor #{@gameType}")

  onGameTick: ->
    console.log("EnvObject.onGameTick #{@gameType}")
    if @gameType == "tree"
      @x += 1
      @y += 1
    else if @gameType == "stone"
      @x += 1
      @y += 1
    else if @gameType == "iron"
      @x += 1
      @y += 1
    else if @gameType == "fruits"
      @x -= 1
      @y -= 1