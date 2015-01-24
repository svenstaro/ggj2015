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
    #Buildings
    @game.load.image("well", "img/well.png")
    #Ground
    @game.load.image("ground-tiles", "img/groundtile_default.png")


  create: ->
    console.log("create")
    @gameTimer = @game.time.create()
    @gameTimer.loop(333, @gameTick, this)
    @gameTimer.start()
    @gameTickEvent = new Phaser.Signal()

    @map = @game.add.tilemap()
    @layer = @map.create('groundlevel', 10, 10, 64, 64)
    tileset = @map.addTilesetImage('ground-tiles')

    # init map
    for x in [0..@map.height]
      for y in [0..@map.width]
        @map.putTile(@game.rnd.integerInRange(0, tileset.total - 1), x, y)

    # for testing
    @game.add.existing(new EnvObject("tree", this, @game, 50, 50))
    @game.add.existing(new EnvObject("shrub", this, @game, 200, 100))
    @game.add.existing(new Item("wood", this, @game, 100, 10))
    @game.add.existing(new Building("well", this, @game, 20, 150))

    # test moving camera
    @game.world.setBounds(-1000, -1000, 2000, 2000)
    window.cursors = @game.input.keyboard.createCursorKeys()

  update: ->
    if (cursors.up.isDown)
      if (cursors.up.shiftKey)
      else
        game.camera.y -= 4
    else if (cursors.down.isDown)
      if (cursors.down.shiftKey)
      else
        game.camera.y += 4
    if (cursors.left.isDown)
      if (cursors.left.shiftKey)
        game.world.rotation -= 0.05
      else
        game.camera.x -= 4
    else if (cursors.right.isDown)
      if (cursors.right.shiftKey)
        game.world.rotation += 0.05
      else
        game.camera.x += 4

  gameTick: ->
    @gameTickEvent.dispatch(this)
