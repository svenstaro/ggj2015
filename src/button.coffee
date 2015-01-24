class window.Button extends Phaser.Button
  constructor: (@gameType, game, x, y) ->
    if @gameType == "well"
      key = "well"
    else if @gameType == "path"
      key = "path"
    else if @gameType == "wheat_farm"
      key = "wheat_farm"
    else if @gameType == "chicken_farm"
      key = "chicken_farm"
    else if @gameType == "cow_farm"
      key = "cow_farm"
    else if @gameType == "hut"
      key = "hut"
    else if @gameType == "storage"
      key = "storage"
    else if @gameType == "bakery"
      key = "bakery"
    else if @gameType == "refinery"
      key = "refinery"
    
    super(game, x, y, key, this.onClick, this)

  onClick: ->
    @game.add.existing(new HoverImage(@game, game.input.mousePointer.x, game.input.mousePointer.y, @key))
    console.log("roflcoptertest")
