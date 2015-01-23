class window.GameState extends Phaser.State
  constructor: ->
    super()
    console.log("mainState")

  preload: ->
    console.log("load")
    @game.load.image("octocat", "img/ball.png")

  create: ->
    console.log("create")
    @game.add.sprite(0,0, "octocat")
