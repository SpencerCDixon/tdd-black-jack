require_relative '../lib/game'
require_relative '../lib/hand'
require_relative '../lib/deck'
require 'pry'

describe Game do
  describe "#initialize" do
    it 'creates getters for main objects' do
      deck = Deck.new
      player = Hand.new
      dealer = Hand.new
      game = Game.new(deck, player, dealer)

      expect(game.instance_variable_get(:@deck)).to eq deck
      expect(game.instance_variable_get(:@player)).to eq player
      expect(game.instance_variable_get(:@dealer)).to eq dealer
    end
  end

  describe "#deal" do
    it "puts a card into the hand" do
      deck = Deck.new
      player = Hand.new
      dealer = Hand.new
      game = Game.new(deck, player, dealer)

      game.deal(player)
      expect(player.cards.count).to eq 1
    end
  end
end

