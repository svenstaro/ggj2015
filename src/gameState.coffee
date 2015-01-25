class window.GameState extends Phaser.State
  constructor: ->
    super()
    console.log("mainState")

  preload: ->
    console.log("load")
    #Buildings
    @game.load.image("well", "img/well.png")
    @game.load.image("well_01", "img/well_01.png")
    @game.load.image("wheat_farm", "img/wheatfarm.png")
    @game.load.image("wheat_farm_01", "img/wheatfarm_01.png")
    @game.load.image("path_01", "img/path_01.png")
    @game.load.image("path", "img/path.png")
    @game.load.image("hut", "img/hut.png")
    @game.load.image("hut_01", "img/hut_01.png")
    @game.load.image("chicken_farm", "img/chickenfarm_01.png")
    @game.load.image("chicken_farm_01", "img/chickenfarm_01.png")
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
    @game.load.image("iron ingot", "img/iron_ingot.png")
    @game.load.image("wheat", "img/wheat.png")
    @game.load.image("chicken", "img/chicken.png")
    #EnvObjects
    @game.load.image("tree", "img/tree.png")
    @game.load.image("cave", "img/cave.png")
    @game.load.image("shrub", "img/shrub.png")

  create: ->
    console.log("create")

    @cursors = @game.input.keyboard.createCursorKeys()

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
    @button_layer = @game.add.group()
    @button_layer.z = 4
    @items_layer = @game.add.group()
    @items_layer.z = 3
    @buildings_layer = @game.add.group()
    @buildings_layer.z = 2
    @environment_layer = @game.add.group()
    @environment_layer.z = 1

    # for testing
    @game.add.existing(new EnvObject("tree", this, @game, 50, 50))
    @game.add.existing(new EnvObject("shrub", this, @game, 200, 100))
    wood = new Item("wood", this, @game, 100, 10)
    @game.add.existing(wood)
    @items_layer.add(wood)
    well_1 = new Building("well", this, @game, 20, 150)
    @game.add.existing(well_1)
    @game.add.existing(new Button("well", @game, 500, 500, 2))
    path = new Building("path", this, @game, 300, 200)
    @game.add.existing(path)
    @game.add.existing(new Button("path", @game, 110, 20, 1))
    @buildings_layer.add(path)
    wheatfarm = new Building("wheat_farm", this, @game, 20, 150)
    @game.add.existing(wheatfarm)
    #style of the text for buttons
    @style = {fill:"white", font:"14px Arial"}
    
    #buttons on the right edge of the screen
    @button_layer.add(@game.add.existing(new Button("well_01", @game, 900, 25, 2)))
    text_well = @game.add.text(885, 3, "A well: water", @style)
    @button_layer.add(@game.add.existing(new Button("wheat_farm_01", @game, 900, 150, 3)))
    text_well = @game.add.text(875, 113, "Farm1: wheat", @style)
    @button_layer.add(@game.add.existing(new Button("chicken_farm_01", @game, 900, 250, 3)))
    text_well = @game.add.text(855, 223, "Fram2: eggs, chicken", @style)
    @button_layer.add(@game.add.existing(new Button("hut_01", @game, 900, 350, 3)))
    text_well = @game.add.text(855, 323, "Hut: babies, workers", @style)
    @button_layer.add(@game.add.existing(new Button("path_01", @game, 920, 450, 1)))
    text_well = @game.add.text(855, 423, "Road: workers move", @style)
    # test moving camera
    @game.world.setBounds(0, 0, 2000, 2000)

  update: ->
    if (@cursors.up.isDown)
      game.camera.y -= 4
    else if (@cursors.down.isDown)
      game.camera.y += 4
    if (@cursors.left.isDown)
      game.camera.x -= 4
    #else if (@cursors.right.isDown)
     # game.camera.x += 4

  gameTick: ->
    @gameTickEvent.dispatch(this)
