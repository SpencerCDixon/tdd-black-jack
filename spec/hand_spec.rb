require_relative '../lib/hand'
require_relative '../lib/deck'

describe Hand do
  let(:hand) { Hand.new }

  describe "#initialize" do
    it "creates an empty array to put cards in" do
      expect(hand.cards).to eq []
    end
  end
end

