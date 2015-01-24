class window.Button extends Phaser.Button
  constructor: (@gameType, game, x, y) ->
    if @gameType == "well"
      key = "well"

    super(game, x, y, key, this.onClick, this)

  onClick: ->
    @game.add.existing(new HoverImage(@game, game.input.mousePointer.x, game.input.mousePointer.y, @key))
    console.log("roflcoptertest")
