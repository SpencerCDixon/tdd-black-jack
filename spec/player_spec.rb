require_relative '../lib/player'
require_relative '../lib/board'
require 'spec_helper'

describe Player do
  let(:board) { Board.new }
  let(:player) { Player.new("Spencer", "X") }

  context "accessors" do
    describe "#name" do
      it "returns the players name" do
        expect(player.name).to eq "Spencer"
      end
    end

    describe "#symbol" do
      it "returns the players marker" do
        expect(player.marker).to eq "X"
      end
    end
  end

  describe "#get_coordinates" do
    it "returns a hash with row and column number" do
      allow(player).to receive(:gets).and_return("1\n", "1\n")
      expect(player.get_coordinates).to eq ([1,1])
    end
  end
end
