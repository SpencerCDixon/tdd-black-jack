require_relative 'hand'

class Person
  attr_reader :hand, :name
  def initialize(name)
    @hand = Hand.new
    @name = name.capitalize
  end

  def cards
    hand.cards
  end

  def hand_summary
    summary = "#{name} has: "
    hand.cards.each { |c| summary << "#{c} " }
    summary << " Total: #{hand.total_score}"
    summary
  end
end
