@game = new Phaser.Game(1024, 768, Phaser.AUTO)
@game.title = "Feed The Beast"
@game.state.add("main", new GameState(), true)
console.log("main")
