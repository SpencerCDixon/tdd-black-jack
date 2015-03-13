class Cell
  attr_reader :row, :column
  attr_accessor :value

  def initialize(row, column)
    @value = "empty"
    @row = row
    @column = column
  end

  def not_taken?
    value == "empty"
  end
end
