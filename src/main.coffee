@game = new Phaser.Game(800, 600, Phaser.AUTO)
@game.title = "Fead The Beast"
@game.state.add 'main', new GameState
console.log "main"
