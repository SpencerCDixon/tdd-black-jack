require_relative '../lib/card'
describe Card do
  describe "#to_s" do
    it "returns a nicely formatted version of the card" do
      card = Card.new('♣', 4)
      expect(card.to_s).to eq '♣4'
    end
  end
end
