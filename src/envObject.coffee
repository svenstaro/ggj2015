class window.EnvObject extends Phaser.Sprite
  constructor: (@gameType, state, game, x, y) ->
    if @gameType == "tree"
      key = "tree"
    else if @gameType == "cave"
      key = "cave"
    else if @gameType == "shrub"
      key = "shrub"

    super(game, x, y, key)

    state.gameTickEvent.add(@onGameTick, this)

    console.log("EnvObject.constructor #{@gameType}")

  onGameTick: ->
    if @gameType == "tree"
      @x += 0
      @y += 0
    else if @gameType == "cave"
      @x += 0
      @y += 0
    else if @gameType == "shrub"
      @x -= 0
      @y -= 0
