require_relative 'cell'
require_relative 'player'
require 'pry'

class Board
  attr_reader :cells, :players

  def initialize
    @cells = []
    @players = []
  end

  def update_cell(coordinates, player)
    cell = find_cell_by_coordinates(coordinates)
    if cell.not_taken?
      cell.value = player.marker
    else
      puts "Cell taken"
      coordinates = player.get_coordinates
      update_cell(coordinates, player)
    end
  end

  def find_cell_by_coordinates(coordinates)
    cells.find do |cell|
      cell.row == coordinates[0] && cell.column == coordinates[1]
    end
  end

  def take_turns
    players.each do |player|
      coordinates = player.get_coordinates
      update_cell(coordinates, player)
    end
  end

  def build_cells
    [1,2,3].each do |row|
      [1,2,3].each do |column|
        @cells << Cell.new(row, column)
      end
    end
  end

  def get_player_names
    puts "Player 1:"
    @players << Player.new(capture_name, "X")
    puts "Player 2:"
    @players << Player.new(capture_name, "O")
  end

  def capture_name
    print "What's your name? "
    gets.chomp
  end
end
