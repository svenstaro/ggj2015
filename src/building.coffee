class window.Building extends Phaser.Sprite
  constructor: (@gameType, state, game, x, y) ->
    if @gameType == "well"
      key = "octocat"
    else if @gameType == "wheat_farm"
      key = "octocat"
    else if @gameType == "chicken_farm"
      key = "octocat"
    else if @gameType == "cow_farm"
      key = "octocat"
    else if @gameType == "hut"
      key = "black_cat"
    else if @gameType == "storage"
      key = "black_cat"
    else if @gameType == "backery"
      key = "black_cat"
    else if @gameType == "refinery"
      key = "black_cat"


    super(game, x, y, key)

    state.gameTickEvent.add(@onGameTick, this)

    console.log("Building.constructor #{@gameType}")

  onGameTick: ->
    if @gameType == "well"
      @x += 0
      @y += 0
    else if @gameType == "wheat_farm"
      @x += 0
      @y += 0
    else if @gameType == "chicken_farm"
      @x += 0
      @y += 0
    else if @gameType == "cow_farm"
      @x += 0
      @y += 0
    else if @gameType == "hut"
      @x += 0
      @y += 0
    else if @gameType == "storage"
      @x += 0
      @y += 0
    else if @gameType == "backery"
      @x += 0
      @y += 0
    else if @gameType == "refinery"
      @x += 0
      @y += 0
