require_relative '../lib/game'
require_relative '../lib/dealer'
require_relative '../lib/player'
require 'pry'

describe Game do
  describe "#initialize" do
    it 'creates getters for main objects' do
      player = Player.new('spencer')
      game = Game.new(player)

      expect(game.instance_variable_get(:@player)).to eq player
    end
  end

  describe "#start_round" do
    it "puts a card into the hand" do
      player = Player.new('spencer')
      game = Game.new(player)

      game.start_round
      expect(player.cards.count).to eq 2
      expect(game.dealer.cards.count).to eq 2
    end
  end

  describe "#check_winner" do
    it "returns player winner" do
      player = double(total_score: 21, name: "Spencer")
      game = Game.new(player)

      expect(game.check_winner).to eq "Spencer wins!"
    end

    it "returns dealer winner" do
      player = double(total_score: 25, name: "Spencer")
      game = Game.new(player)

      expect(game.check_winner).to eq "Dealer wins :("
    end
  end

  describe "#clear_cards" do
    it "clears players cards" do
      player = double(cards: [1,2])
      game = Game.new(player)

      game.clear_cards
      expect(player.cards).to eq []
    end

    it "clears dealers cards" do
      player = double(cards: [1,2])
      game = Game.new(player)
      dealer = game.dealer
      dealer.deal(dealer)
      expect(dealer.cards.size).to eq 1

      game.clear_cards
      expect(dealer.cards).to eq []
    end
  end

  describe "#check_bust" do
    it "returns nil if no bust" do
      player = Player.new("spencer")
      game = Game.new(player)
      expect(game.check_bust(player)).to eq nil
    end
  end


end

