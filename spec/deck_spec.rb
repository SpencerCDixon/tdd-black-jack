require_relative '../lib/deck'
require 'pry'

describe Deck do
  let(:deck) { Deck.new }

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end

    it "shuffles deck aftering being built" do
      first_cards = deck.cards[0..1].map { |c| c.to_s }
      expect(first_cards).to_not eq ['2♦', '3♦']
    end
  end

  describe "#draw!" do
    it "deals the top card in the deck" do
      correct_card = deck.cards[-1]
      expect(deck.draw!).to eq correct_card
    end
  end
end
