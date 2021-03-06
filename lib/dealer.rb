require_relative 'person'
require_relative 'deck'

class Dealer < Person
  attr_reader :deck
  def initialize(name)
    super(name)
    @deck = Deck.new
  end

  def deal(player)
    card = deck.draw!
    puts "#{player.name} was dealt a #{card}"
    player.cards << card
  end
end
