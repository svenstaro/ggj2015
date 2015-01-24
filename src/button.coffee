class window.Button extends Phaser.Button
  constructor: (@gameType, game, x, y, @tileWidth) ->
    key = @gameType
    super(game, x, y, key, this.onClick, this)

  onClick: ->
    if game.input.mouse.button == Phaser.Mouse.LEFT_BUTTON
      @game.add.existing(new HoverImage(@game,
        @gameType,
        game.input.mousePointer.x,
        game.input.mousePointer.y,
        @tileWidth))
