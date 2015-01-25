class window.GameState extends Phaser.State
  constructor: ->
    super()
    console.log("mainState")

  preload: ->
    console.log("load")
    #Buildings
    @game.load.image("well", "img/well_01.png")
    @game.load.image("wheat_farm", "img/wheatfarm_01.png")
    @game.load.image("path", "img/path.png")
    @game.load.image("hut", "img/hut_01.png")
    @game.load.image("chicken_farm", "img/chickenfarm_01.png")
    #Ground
    @game.load.image("ground-tiles", "img/groundtile_default.png")
    #Items
    @game.load.image("wood", "img/wood_01.png")
    @game.load.image("stone", "img/stone_01.png")
    @game.load.image("egg", "img/eggs_01.png")
    @game.load.image("straw", "img/straw_01.png")
    @game.load.image("wheat", "img/wheat_01.png")
    @game.load.image("fruits", "img/fruits.png")
    @game.load.image("chicken", "img/chicken_01.png")
    @game.load.image("water", "img/water_01.png")
    #EnvObjects
    @game.load.image("tree", "img/tree_01.png")
    @game.load.image("cave", "img/cave_01.png")
    @game.load.image("shrub", "img/shrub.png")

  create: ->
    console.log("create")

    @game.physics.startSystem(Phaser.Physics.ARCADE)

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
    #InputLayer
    @input_layer = @game.add.group()
    @input_layer.z = 6
    @input_layer.physicsBodyType = Phaser.Physics.ARCADE
    @input_layer.enableBody = true
    #Outputlayer
    @output_layer = @game.add.group()
    @output_layer.z = 5
    @output_layer.physicsBodyType = Phaser.Physics.ARCADE
    @output_layer.enableBody = true
    @button_layer = @game.add.group()
    @button_layer.z = 4
    #ItemLayer
    @items_layer = @game.add.group()
    @items_layer.z = 3
    #BuildingLayer
    @buildings_layer = @game.add.group()
    @buildings_layer.physicsBodyType = Phaser.Physics.ARCADE
    @buildings_layer.enableBody = true
    @buildings_layer.z = 2
    #EnvironmentLayer
    @environment_layer = @game.add.group()
    @environment_layer.physicsBodyType = Phaser.Physics.ARCADE
    @environment_layer.enableBody = true
    @environment_layer.z = 1

    # EnvObjects on random locations
    for i in [0..10]
      @environment_layer.add(@game.add.existing(new EnvObject("tree", this, @game, @game.rnd.between(0, 12)*64, @game.rnd.between(0, 11)*64)))
    for i in [0..15]
      @environment_layer.add(@game.add.existing(new EnvObject("shrub", this, @game, @game.rnd.between(0, 12)*64, @game.rnd.between(0, 11)*64)))
    for i in [0..5]
      @environment_layer.add(@game.add.existing(new EnvObject("cave", this, @game, @game.rnd.between(0, 12)*64, @game.rnd.between(0, 11)*64)))
    #style of the text for buttons
    @style = {fill:"white", font:"14px Arial"}
    
    #buttons on the right edge of the screen
    @button_layer.add(@game.add.existing(new Button("well", @game, 900, 25, 2)))
    text_well = @game.add.text(885, 3, "A well: water", @style)
    @button_layer.add(@game.add.existing(new Button("wheat_farm", @game, 900, 150, 3)))
    text_well = @game.add.text(875, 113, "Farm1: wheat", @style)
    @button_layer.add(@game.add.existing(new Button("chicken_farm", @game, 900, 250, 3)))
    text_well = @game.add.text(855, 223, "Fram2: eggs, chicken", @style)
    @button_layer.add(@game.add.existing(new Button("hut", @game, 900, 350, 3)))
    text_well = @game.add.text(855, 323, "Hut: babies, workers", @style)
    @button_layer.add(@game.add.existing(new Button("path", @game, 900, 450, 1)))
    text_well = @game.add.text(855, 423, "Road: workers move", @style)
    # test moving camera
    @game.world.setBounds(0, 0, 1000, 600)

  update: ->
    #if (@cursors.up.isDown)
    #  game.camera.y -= 4
    #else if (@cursors.down.isDown)
    #  game.camera.y += 4
    #if (@cursors.left.isDown)
    #  game.camera.x -= 4
    #else if (@cursors.right.isDown)
     # game.camera.x += 4

  gameTick: ->
    @gameTickEvent.dispatch(this)
