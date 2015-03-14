class Hand
  attr_reader :cards
  def initialize
    @cards = []
  end

  def total_score
    aces = 0
    cards.each { |c| aces += 1 if c.rank == "A" }
    cards.delete_if { |c| c.rank == "A" }
    total = cards.inject(0) { |sum, card| sum + card.value }
    handle_aces(aces, total)
  end

  def handle_aces(aces, total)
    case aces
    when 0
      total
    when 1
      total <= 10 ? total += 11 : total += 1
    when 2
      total <= 9 ? total += 12 : total += 2
    end
  end
end
