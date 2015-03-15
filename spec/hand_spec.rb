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
      hand = Hand.new
      add_cards(hand, [8, 5])

      expect(hand.total_score).to eq 13
    end

    it "converts facecards to 10" do
      hand = Hand.new
      add_cards(hand, ["K", 5])

      expect(hand.total_score).to eq 15
    end

    it "converts aces to 11 if total is <= 10" do
      hand = Hand.new
      add_cards(hand, ["A", 10])

      expect(hand.total_score).to eq 21
    end

    it "converts aces to 1 if total is > 10" do
      hand = Hand.new
      add_cards(hand, ["A", 10, 5])

      expect(hand.total_score).to eq 16
    end

    it "converts multiple aces to 1 if total is > 9" do
      hand = Hand.new
      add_cards(hand, ["A", 10, "A"])

      expect(hand.total_score).to eq 12
    end

    it "converts 3 aces to 1 if total is > 8" do
      hand = Hand.new
      add_cards(hand, ["A", 10, "A", "A"])

      expect(hand.total_score).to eq 13
    end

    it "converts aces properly if total < 8" do
      hand = Hand.new
      add_cards(hand, ["A", 5, "A", "A"])

      expect(hand.total_score).to eq 18
    end
  end
end

def add_cards(hand, arr)
  arr.each do |rank|
    hand.cards << Card.new("heart", rank)
  end
end
