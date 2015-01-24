class window.BuildingWell extends Building
  constructor: (game) ->
    rules = {
      true: ItemWater
      }
    super(game, "ball", rules)