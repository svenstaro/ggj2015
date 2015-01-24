class window.HoverImage extends Phaser.Image
  constructor: (game, @gameType, x, y, @tileWidth) ->
    key = @gameType
    super(game, x, y, key)
    game.input.onDown.add(this.onClick, this)
    window.HoverImage.current = this
    @alpha = 0.5
    @placable = false

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
    if x > map.widthInPixels - @tileWidth*tileSize
      x = map.widthInPixels - @tileWidth*tileSize
    if y > map.heightInPixels - @tileWidth*tileSize
      y = map.heightInPixels - @tileWidth*tileSize

    @x = x
    @y = y

    if @placable
      @tint = 0x55FF55
    else
      @tint = 0xFF5555

  onClick: ->
    if game.input.mouse.button == Phaser.Mouse.LEFT_BUTTON
      if @placable
        game.add.existing(new Building(@gameType, game.state.getCurrentState(), game, @x, @y))
    else
        game.input.onDown.remove(this.onClick, this)
        window.HoverImage.current = null
        this.destroy()


window.HoverImage.current = null
