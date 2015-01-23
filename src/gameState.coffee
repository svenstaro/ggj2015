class window.GameState extends Phaser.State
  constructor: ->
    super()
    console.log("mainState")

  preload: ->
    console.log("load")

  create: ->
    console.log("create")
    # @logo = new LogoSprite(@game, @game.world.centerX, @game.world.centerY, 'logo')
    # @game.world.add(@logo)
