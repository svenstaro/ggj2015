class window.HoverImage extends Phaser.Image
  constructor: (game, x, y, key) ->
    super(game, x, y, key)
    @game.input.onDown.add((-> this.destroy()), this)

  update: ->
    map = game.state.getCurrentState().map
    tileSize = map.tileWidth
    console.log()
    x = game.input.mousePointer.x - (game.input.mousePointer.x % tileSize)
    y = game.input.mousePointer.y - (game.input.mousePointer.y % tileSize)
    if x < 0
      x = 0
    if y < 0
      y = 0
    if x > map.widthInPixels
      x = map.widthInPixels - tileSize
    if y > map.heightInPixels
      y = map.heightInPixels - tileSize


    @x = x
    @y = y
