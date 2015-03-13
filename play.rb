require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/cell'
require 'pry'

board = Board.new
board.build_cells
board.get_player_names
board.take_turns

