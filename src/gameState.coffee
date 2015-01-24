class window.GameState extends Phaser.State
  constructor: ->
    super()
    console.log("mainState")

  preload: ->
    console.log("load")
    #Buildings
    @game.load.image("well", "img/well.png")
    @game.load.image("wheat_farm", "img/well.png")
    @game.load.image("path", "img/path.png")
    @game.load.image("hut", "img/hut.png")
    #Ground
    @game.load.image("ground-tiles", "img/groundtile_default.png")
    #Items
    @game.load.image("wood", "img/wood.png")
    @game.load.image("steak", "img/steak.png")
    @game.load.image("stone", "img/stone.png")
    #EnvObjects
    @game.load.image("tree", "img/tree.png")

  create: ->
    console.log("create")
    @gameTimer = @game.time.create()
    @gameTimer.loop(333, @gameTick, this)
    @gameTimer.start()
    @gameTickEvent = new Phaser.Signal()

    @map = @game.add.tilemap()
    @layer = @map.create('groundlevel', 16, 12, 64, 64)
    tileset = @map.addTilesetImage('ground-tiles')

    console.log(@map.height, @map.width)

    # init map
    for x in [0..@map.height]
      for y in [0..@map.width]
        @map.putTile(@game.rnd.integerInRange(0, tileset.total - 1), x, y)

    # for testing
    @game.add.existing(new EnvObject("tree", this, @game, 50, 50))
    @game.add.existing(new EnvObject("shrub", this, @game, 200, 100))
    @game.add.existing(new Item("wood", this, @game, 100, 10))
    @game.add.existing(new Building("well", this, @game, 20, 150))
    @game.add.existing(new Button("well", @game, 500, 500))
    @game.add.existing(new Building("path", this, @game, 300, 200))
    @game.add.existing(new Button("path", @game, 300, 200))
    wheatfarm = new Building("wheat_farm", this, @game, 20, 150)
    @game.add.existing(wheatfarm)
    #wheatfarm.itemsIn(["water"])

    # test moving camera
    @game.world.setBounds(0, 0, 2000, 2000)
    window.cursors = @game.input.keyboard.createCursorKeys()

  update: ->
    if (cursors.up.isDown)
      game.camera.y -= 4
    else if (cursors.down.isDown)
      game.camera.y += 4
    if (cursors.left.isDown)
      game.camera.x -= 4
    else if (cursors.right.isDown)
      game.camera.x += 4

  gameTick: ->
    @gameTickEvent.dispatch(this)
