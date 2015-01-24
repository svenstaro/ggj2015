class window.Button extends Phaser.Button
  constructor: (@gameType, game, x, y) ->
    key = @gameType
    super(game, x, y, key, this.onClick, this)

  onClick: ->
    @game.add.existing(new HoverImage(@game,
      @key,
      game.input.mousePointer.x,
      game.input.mousePointer.y))
    console.log("roflcoptertest")