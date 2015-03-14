require_relative '../lib/hand'
require_relative '../lib/deck'

describe Hand do
  let(:hand) { Hand.new }

  describe "#initialize" do
    it "creates an empty array to put cards in" do
      expect(hand.cards).to eq []
    end
  end

  describe "#total_score" do
    it "creates correct total with no face cards" do
      card1 = Card.new("heart", 8)
      card2 = Card.new("heart", 5)
      hand = Hand.new
      hand.cards << card1
      hand.cards << card2

      expect(hand.total_score).to eq 13
    end

    it "converts facecards to 10" do
      card1 = Card.new("heart", "K")
      card2 = Card.new("heart", 5)
      hand = Hand.new
      hand.cards << card1
      hand.cards << card2

      expect(hand.total_score).to eq 15
    end

    it "converts aces to 11 if total is <= 10" do
      card1 = Card.new("heart", "A")
      card2 = Card.new("heart", 10)
      hand = Hand.new
      hand.cards << card1
      hand.cards << card2

      expect(hand.total_score).to eq 21
    end

    it "converts aces to 1 if total is > 10" do
      card1 = Card.new("heart", "A")
      card2 = Card.new("heart", 10)
      card3 = Card.new("heart", 5)
      hand = Hand.new
      hand.cards << card1
      hand.cards << card2
      hand.cards << card3

      expect(hand.total_score).to eq 16
    end

    it "converts multiple aces to 1 if total is > 9" do
      card1 = Card.new("heart", "A")
      card2 = Card.new("heart", 10)
      card3 = Card.new("heart", "A")
      hand = Hand.new
      hand.cards << card1
      hand.cards << card2
      hand.cards << card3

      expect(hand.total_score).to eq 12
    end
  end
end

