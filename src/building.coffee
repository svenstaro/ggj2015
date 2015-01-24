class window.Building extends Phaser.Sprite
  constructor: (game, imageKey, @rules) ->
    super(game, imageKey)

  process: (input) ->
    