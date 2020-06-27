require './brave'
require './monster'
require './games_controller'

games_controller = GamesController.new

brave = Brave.new( name: "クラウド", hp: 500, offense: 200, defense: 100)
monster = Monster.new( name: "セフィロス", hp: 500, offense: 200, defense: 100)

games_controller.battle(brave: brave, monster: monster)


EXP_CONSTANT = 2
GIL_CONSTANT = 3