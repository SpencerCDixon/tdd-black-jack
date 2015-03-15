require_relative 'lib/game'
require_relative 'lib/player'

print "What's your name?: "
name = gets.chomp

game = Game.new(Player.new(name))
game.play
