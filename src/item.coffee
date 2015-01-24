class window.Item extends Phaser.Sprite
  constructor: (@gameType, state, @game, x, y) ->
    if @gameType == "wood"
      @key = "octocat"
    else if @gameType == "fruits"
      @key = "octocat"
    else if @gameType == "stone"
      @key = "octocat"
    else if @gameType == "iron"
      @key = "black_cat"
    else if @gameType == "water"
      @key = "black_cat"
    else if @gameType == "straw"
      @key = "black_cat"
    else if @gameType == "wheat"
      @key = "black_cat"
    else if @gameType == "egg"
      @key = "black_cat"
    else if @gameType == "milk"
      @key = "black_cat"
    else if @gameType == "steak"
      @key = "black_cat"
    else if @gameType == "baby"
      @key = "black_cat"
    else if @gameType == "worker"
      @key = "black_cat"
    else if @gameType == "cookie"
      @key = "black_cat"
    else if @gameType == "bread"
      @key = "black_cat"
    else if @gameType == "iron ingots"
      @key = "black_cat"

    super(@game, x, y, @key)

    state.gameTickEvent.add(@onGameTick, this)

    console.log("Item.constructor #{@gameType}")

  onGameTick: ->
    console.log("Item.onGameTick #{@gameType}")
    if @gameType == "wood"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "fruits"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "stone"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "iron"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "water"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "straw"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "wheat"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "egg"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "milk"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "steak"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "baby"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "worker"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "cookie"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "bread"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    else if @gameType == "iron ingots"
      console.log("Get some piece of me!!!")
      @x += 1
      @y += 1
    