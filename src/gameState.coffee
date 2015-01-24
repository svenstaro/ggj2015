class window.GameState extends Phaser.State
  constructor: ->
    super()
    console.log("mainState")

  preload: ->
    console.log("load")
    @game.load.image("octocat", "img/ball.png")
    @game.load.image("black_cat", "img/ball_01.png")
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
    @game.add.existing(new EnvObject("shrub", this, @game, 200, 100))

    @map = @game.add.tilemap()
    @layer = @map.create('level1', 30, 30, 32, 32)
    @map.addTilesetImage('octocat', 'octocat')
    for lol in [0..30]
      @map.putTile('octocat', lol, lol)


  gameTick: ->
    @gameTickEvent.dispatch(this)
