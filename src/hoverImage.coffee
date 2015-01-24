class window.HoverImage extends Phaser.Image
  constructor: -> (@game, x, y, image)
    super(@game, x, y, image)
    func = (this) -> this.destroy()
    @game.input.onDown.add(func.this)

  update: -> ()
    @x = game.input.mousePointer.x
    @y = game.input.mousePointer.y
