class window.HoverImage extends Phaser.Image
  constructor: (game, @gameType, x, y) ->
    key = @gameType
    super(game, x, y, key)
    game.input.onDown.add(this.onClick, this)

  update: ->
    map = game.state.getCurrentState().map

    tileSize = map.tileWidth

    offsetX = map.widthInPixels/2 - game.camera.position.x
    offsetY = map.heightInPixels/2 - game.camera.position.y
    
    mouseX = game.input.mousePointer.x - offsetX
    mouseY = game.input.mousePointer.y - offsetY
    x = mouseX - (mouseX % tileSize)
    y = mouseY - (mouseY % tileSize)
    if x < 0
      x = 0
    if y < 0
      y = 0
    if x > map.widthInPixels - tileSize
      x = map.widthInPixels - tileSize
    if y > map.heightInPixels - tileSize
      y = map.heightInPixels - tileSize

    @x = x
    @y = y

  onClick: ->
    game.add.existing(new Building(@gameType, game.state.getCurrentState(), game, @x, @y))
    this.destroy()
