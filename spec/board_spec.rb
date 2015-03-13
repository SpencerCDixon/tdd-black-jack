require 'spec_helper'
require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }

  context "accessors" do
    describe "#cells" do
      it "starts with empty cells" do
        expect(board.cells).to be_empty
      end
    end

    describe "#players" do
      it "returns empty array" do
        expect(board.players).to be_empty
      end
    end
  end

  describe "#build_cells" do
    it "creates 9 cells" do
      board.build_cells

      expect(board.cells.size).to eq 9
      board.cells.each do |cell|
        expect(cell).to be_an_instance_of Cell
      end
    end
  end

  describe "#capture_name" do
    it "returns name user wrote" do
      allow(board).to receive(:gets).and_return("Spencer")
      expect(board.capture_name).to eq "Spencer"
    end
  end

  describe "#get_player_names" do
    it "creates two new players" do
      allow(board).to receive(:gets).and_return("Spencer")
      board.get_player_names

      expect(board.players.size).to eq 2

      board.players.each do |player|
        expect(player).to be_an_instance_of Player
      end
    end
  end

  describe "#update_cell" do
    it "updates the cell with players marker" do
      player = Player.new("Spencer", "X")
      coordinates = [1,1]
      board.build_cells

      board.update_cell(coordinates, player)
      cell = board.find_cell_by_coordinates(coordinates)
      expect(cell.value).to eq "X"
    end
  end

  describe "#find_cell_by_coordinates" do
    it "finds and returns the cell" do
      board.build_cells
      coordinates = [1,1]
      cell = board.find_cell_by_coordinates(coordinates)

      expect(board.find_cell_by_coordinates(coordinates)).
        to be_an_instance_of Cell
      expect(cell.row).to eq 1
      expect(cell.column).to eq 1
    end
  end

end
