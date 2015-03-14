class Card
  attr_reader :rank
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def value
    ["J","Q","K"].include?(@rank) ? 10 : @rank
  end

  def to_s
    "#{@rank}#{@suit}"
  end
end
