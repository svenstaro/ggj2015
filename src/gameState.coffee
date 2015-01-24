class window.GameState extends Phaser.State
  constructor: ->
    super()
    console.log("mainState")

  preload: ->
    console.log("load")
    #Buildings
    @game.load.image("well", "img/well.png")
    @game.load.image("wheat_farm", "img/wheatfarm.png")
    @game.load.image("path", "img/path.png")
    @game.load.image("hut", "img/hut.png")
    @game.load.image("chicken_farm", "img/chickenfarm.png")
    #Ground
    @game.load.image("ground-tiles", "img/groundtile_default.png")
    #Items
    @game.load.image("wood", "img/wood.png")
    @game.load.image("steak", "img/steak.png")
    @game.load.image("stone", "img/stone.png")
    @game.load.image("cookie", "img/cookie.png")
    @game.load.image("bread", "img/bread.png")
    @game.load.image("iron", "img/uref_iron.png")
    @game.load.image("egg", "img/eggs.png")
    @game.load.image("straw", "img/straw.png")
    #EnvObjects
    @game.load.image("tree", "img/tree.png")
    @game.load.image("cave", "img/cave.png")
    @game.load.image("shrub", "img/shrub.png")

  create: ->
    console.log("create")
    
    @game.canvas.setAttribute("oncontextmenu", "return false;")
    
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

    #create group of items to place them above other objects
    window.items_layer = @game.add.group()
    window.items_layer.z = 2
    window.buildings_layer = @game.add.group()
    window.buildings_layer.z = 1
    
    # for testing
    @game.add.existing(new EnvObject("tree", this, @game, 50, 50))
    @game.add.existing(new EnvObject("shrub", this, @game, 200, 100))
    wood = new Item("wood", this, @game, 100, 10)
    @game.add.existing(wood)
    window.items_layer.add(wood)
    console.log()
    well_1 = new Building("well", this, @game, 20, 150)
    @game.add.existing(well_1)
    @game.add.existing(new Button("well", @game, 500, 500, 2))
    path = new Building("path", this, @game, 300, 200)
    @game.add.existing(path)
    @game.add.existing(new Button("path", @game, 110, 20, 1))
    window.buildings_layer.add(path)
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
