class window.HoverImage extends Phaser.Image
  constructor: (game, x, y, key) ->
    super(game, x, y, key)
    @game.input.onDown.add(-> this.destroy())

  update: ->
    @x = game.input.mousePointer.x
    @y = game.input.mousePointer.y
