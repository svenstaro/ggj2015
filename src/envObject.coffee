class window.EnvObject extends Phaser.Sprite
  constructor: (@gameType, state, @game, x, y) ->
    if @gameType == "tree"
      @key = "octocat"
    else if @gameType == "stone"
      @key = "octocat"
    else if @gameType == "iron"
      @key = "octocat"
    else if @gameType == "fruits"
      @key = "octocat"

    super(@game, x, y, @key)

    state.gameTickEvent.add(@onGameTick, this)

    console.log("EnvObject.constructor #{@gameType}")

  onGameTick: ->
    console.log("EnvObject.onGameTick #{@gameType}")
    if @gameType == "tree"
      @x += 5
      @y += 5
    else if @gameType == "stone"
      pass
    else if @gameType == "iron"
      pass
    else if @gameType == "fruits"
      @x -= 5
      @y -= 5