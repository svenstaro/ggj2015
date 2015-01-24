@game = new Phaser.Game(800, 600, Phaser.AUTO)
@game.title = "Feed The Beast"
@game.state.add("main", new GameState(), true)
console.log("main")
