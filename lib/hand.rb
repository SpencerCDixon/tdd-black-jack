class Hand
  attr_reader :cards
  def initialize
    @cards = []
  end

  # need to reduce the number of iterations
  def total_score
    aces = 0
    cards.each { |c| aces += 1 if c.rank == "A" }
    non_aces = cards.partition { |c| c.rank == "A" }
    total = non_aces[1].inject(0) { |sum, card| sum + card.value }
    handle_aces(aces, total)
  end

  def handle_aces(aces, total)
    total += aces * 11
    aces.times { total -= 10 if total > 21 }
    total
  end

  def hand_summary
    summary = ''
    cards.each { |c| summary << "#{c}" }
    summary << " Total: #{total_score}"
  end
end
