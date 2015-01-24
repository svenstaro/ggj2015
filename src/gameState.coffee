class window.GameState extends Phaser.State
  constructor: ->
    super()
    console.log("mainState")

  preload: ->
    console.log("load")
    @game.load.image("octocat", "img/ball.png")
    # @game.add.image('wood', 'img/wood.png')
    # @game.add.image('fruits', 'img/fruits.png')
    # @game.add.image('stone', 'img/stone.png')
    # @game.add.image('iron', 'img/iron.png')

  create: ->
    console.log("create")
    @gameTimer = @game.time.create()
    @gameTimer.loop(333, @gameTick, this)
    @gameTimer.start()
    @gameTickEvent = new Phaser.Signal()

    # for testing
    @game.add.existing(new EnvObject("tree", this, @game, 50, 50))
    @game.add.existing(new EnvObject("fruits", this, @game, 200, 100))


  gameTick: ->
    @gameTickEvent.dispatch(this)
