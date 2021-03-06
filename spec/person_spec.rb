require_relative '../lib/person'
require_relative '../lib/deck'

describe Person do
  describe "#initialize" do
  let(:spencer) { Person.new("spencer") }

    it "has an accessor for the persons hand" do
      expect(spencer.hand.class).to eq Hand
    end

    it "has a reader for their name" do
      expect(spencer.name).to eq "Spencer"
    end
  end

  describe "#cards" do
    it "returns the cards array from the Hand class" do
      spencer = Person.new("spencer")
      hand = spencer.hand

      expect(spencer.cards).to eq hand.cards
    end
  end

  describe "#total_score" do
    it "returns total_score from hand" do
      spencer = Person.new("spencer")
      hand = spencer.hand.cards
      hand << Card.new('heart', 10)

      expect(spencer.total_score).to eq 10
    end
  end

  describe "#hand_summary" do
    let(:spencer) { Person.new("spencer") }

    it "returns empty hand if person has no cards" do
      expect(spencer.hand_summary).to eq "Spencer has:  Total: 0"
    end

    it "returns correct summary of cards" do
      card = Card.new('♦', 10)
      spencer.cards << card

      expect(spencer.hand_summary).to eq "Spencer has: 10♦  Total: 10"
    end
  end
end
