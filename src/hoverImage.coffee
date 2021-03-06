class window.HoverImage extends Phaser.Sprite
  constructor: (game, @gameType, x, y, @tileWidth) ->
    @counter = 0
    @pathList = []
    key = @gameType
    super(game, x, y, key)
    game.input.onDown.add(this.onClick, this)
    window.HoverImage.current = this
    @alpha = 0.5
    @placable = false
    @game.physics.arcade.enableBody(this)
    
    input  = new Phaser.Graphics(@game, -64, 0)
    input.beginFill(0x00FF00, 0.5)
    input.drawRect(0, 0, 64, 64)
    input.endFill()
    this.addChild(input)
    output  = new Phaser.Graphics(@game, 64, 0)
    output.beginFill(0xFF0000, 0.5)
    output.drawRect(0, 0, 64, 64)
    output.endFill()
    this.addChild(output)
    rotate_key = @game.input.keyboard.addKey(Phaser.Keyboard.R)
    rotate_key.onDown.add((-> this.angle+=90), this)

  update: ->
    map = game.state.getCurrentState().map

    tileSize = map.tileWidth

    offsetX = map.widthInPixels/2 - game.camera.position.x
    offsetY = map.heightInPixels/2 - game.camera.position.y
    
    mouseX = game.input.mousePointer.x - offsetX
    mouseY = game.input.mousePointer.y - offsetY
    x = mouseX - (mouseX % tileSize)
    y = mouseY - (mouseY % tileSize)
    if x < 0
      x = 0
    if y < 0
      y = 0
    if x > map.widthInPixels - @tileWidth*tileSize
      x = map.widthInPixels - @tileWidth*tileSize
    if y > map.heightInPixels - @tileWidth*tileSize
      y = map.heightInPixels - @tileWidth*tileSize

    @x = x
    @y = y
    colliding_building = @game.physics.arcade.overlap(this, game.state.getCurrentState().buildings_layer)
    colliding_environment = @game.physics.arcade.overlap(this, game.state.getCurrentState().environment_layer)
    @placable = !colliding_building and !colliding_environment

    if @placable
      @tint = 0x55FF55
    else
      @tint = 0xFF5555

  onClick: ->

    if game.input.mouse.button == Phaser.Mouse.LEFT_BUTTON
      if @placable
        if @gameType == "path"
          @pathList.push({x: @x, y: @y})

          if this.checkForInput()
            this.buildPath()
            game.input.onDown.remove(this.onClick, this)
            this.destroy()
          @counter = @counter + 1
        else
          new_building = game.add.existing(new Building(@gameType , game.state.getCurrentState(), game, @x, @y, @angle))
          game.state.getCurrentState().buildings_layer.add(new_building)
    else
        game.input.onDown.remove(this.onClick, this)
        window.HoverImage.current = null
        this.destroy()

  checkForInput: ->
    if @counter > 3
      return true
    else
      return false

  buildPath: ->
    map = game.state.getCurrentState().map
    tileSize = map.tileWidth
    @finalpath = []
    @tempPath = {}
    for path, i in @pathList
      @tempPath = path
      if @pathList[i+1]
        if path.x == @pathList[i+1].x and not (path.y == @pathList[i+1].y)
          @direction = @pathList[i+1].y - path.y
          @direction = (@direction/Math.abs(@direction))
          @axis = "y"
        else if path.y == @pathList[i+1].y and not (path.x == @pathList[i+1].x)
          @direction = @pathList[i+1].x - path.x
          @direction = (@direction/Math.abs(@direction))
          @axis = "x"
        else
          window.HoverImage.current = null
          game.input.onDown.remove(this.onClick, this)
          this.destroy()
          return
        
        @running = true
        @finalpath.push({x: @tempPath.x, y: @tempPath.y, direction: @direction, axis: @axis})
        @count = 0
        while @running and @count < 20
          @tempPath[@axis] = @tempPath[@axis] + @direction*tileSize
          # If Position is already used, this needs to be stopped 

          @pointer = new Phaser.Pointer(@game, 1)
          @pointer.x = @tempPath.x
          @pointer.y = @tempPath.y
          @coll = false
          callbackfunc = -> (this.coll = true)
          rofl = @game.physics.arcade.getObjectsUnderPointer(@pointer, @game.state.getCurrentState().buildings_layer, callbackfunc, this)
          if @coll
            window.HoverImage.current = null
            game.input.onDown.remove(this.onClick, this)
            this.destroy()
            return
          
          if @tempPath[@axis] != @pathList[i+1][@axis]
            @finalpath.push({x: @tempPath.x, y: @tempPath.y, direction: @direction, axis: @axis})
          else
            @running = false
          @count = @count + 1

    for tile, i in @finalpath
      new_building = game.add.existing(new Building("path", game.state.getCurrentState(), game, tile.x, tile.y))
      game.state.getCurrentState().buildings_layer.add(new_building)
    window.HoverImage.current = null
      
window.HoverImage.current = null
