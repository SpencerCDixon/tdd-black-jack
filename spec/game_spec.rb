require_relative '../lib/game'
require_relative '../lib/dealer'
require_relative '../lib/player'
require 'pry'

describe Game do
  describe "#initialize" do
    it 'creates getters for main objects' do
      player = Player.new('spencer')
      dealer = Dealer.new('dealer')
      game = Game.new(player, dealer)

      expect(game.instance_variable_get(:@player)).to eq player
      expect(game.instance_variable_get(:@dealer)).to eq dealer
    end
  end

  describe "#start_round" do
    it "puts a card into the hand" do
      player = Player.new('spencer')
      dealer = Dealer.new('dealer')
      game = Game.new(player, dealer)

      game.start_round
      expect(player.cards.count).to eq 2
      expect(dealer.cards.count).to eq 2
    end
  end

  describe "#welcome_screen" do


  end
end

