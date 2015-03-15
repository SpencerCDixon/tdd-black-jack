require_relative 'card'

class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_reader :cards
  def initialize
    @cards = build_deck
  end

  def build_deck
    SUITS.each_with_object([]) do |suit, arr|
      RANKS.each do |rank|
        arr << Card.new(suit, rank)
      end
    end.shuffle!
  end

  def draw!
    cards.pop
  end
end
