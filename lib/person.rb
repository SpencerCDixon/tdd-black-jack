require_relative 'hand'

class Person
  attr_reader :hand, :name
  def initialize(name)
    @hand = Hand.new
    @name = name.downcase.capitalize
  end

  def cards
    hand.cards
  end

  def total_score
    hand.total_score
  end

  def hand_summary
    summary = "#{name} has: "
    hand.cards.each { |c| summary << "#{c} " }
    summary << " Total: #{total_score}"
  end
end
