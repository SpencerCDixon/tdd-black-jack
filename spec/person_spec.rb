require_relative '../lib/person'

describe Person do
  describe "#initialize" do
  let(:spencer) { Person.new("spencer") }

    it "has an accessor for the persons hand" do
      expect(spencer.hand.class).to eq Hand
    end

    it "has a reader for their name" do
      expect(spencer.name).to eq "spencer"
    end
  end
end
