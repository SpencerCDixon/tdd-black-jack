require_relative '../lib/cell'

describe Cell do
  describe "#value" do
    it "returns the current value of the cell" do
      cell = Cell.new(1, 1)
      expect(cell.value).to eq "empty"
    end
  end

  describe "#row" do
    it "returns the row for the cell" do
      cell = Cell.new(1, 1)
      expect(cell.row).to eq 1
    end
  end

  describe "#column" do
    it "return the column for the cell" do
      cell = Cell.new(1, 1)
      expect(cell.column).to eq 1
    end
  end

  describe "#not_taken?" do
    let(:cell) { Cell.new(1, 1) }

    it "returns true if value not empty" do
      expect(cell.not_taken?).to be true
    end

    it "returns false if value is empty" do
      cell.value = "X"
      expect(cell.not_taken?).to be false
    end
  end
end

