class window.EnvObject extends Phaser.Sprite
  constructor: (@gameType, state, game, x, y) ->
    if @gameType == "tree"
      key = "tree"
    else if @gameType == "cave"
      key = "octocat"
    else if @gameType == "mountain"
      key = "octocat"
    else if @gameType == "shrub"
      key = "black_cat"

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
    else if @gameType == "mountain"
      @x += 0
      @y += 0
    else if @gameType == "shrub"
      @x -= 0
      @y -= 0
