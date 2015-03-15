require_relative '../lib/card'

describe Card do
  describe "#to_s" do
    it "returns a nicely formatted version of the card" do
      card = Card.new('♣', 4)
      expect(card.to_s).to eq '4♣'
    end
  end

  describe "#value" do
    it "returns 10 for facecards" do
      king = Card.new('heart', 'K')
      queen = Card.new('heart', 'Q')
      jack = Card.new('heart', 'J')
      [king, queen, jack].each do |card|
        expect(card.value).to eq 10
      end
    end

    it "returns rank for other cards" do
      (2..10).each do |num|
        card = Card.new('heart', num)
        expect(card.value).to eq num
      end
    end
  end
end
