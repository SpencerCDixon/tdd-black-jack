require_relative 'player'
require_relative 'dealer'
require 'pry'

class Game
  attr_reader :player, :dealer
  def initialize(player, dealer)
    @player = player
    @dealer = dealer
  end

  def play
    welcome_screen
    initial_deal
    player_turn
  end

  def welcome_screen
    puts <<-EOH
############################################
## Welcome to Black Jack!                 ##
## Some more rules and stuff will go here ##
############################################

    EOH
  end

  def initial_deal
    2.times { dealer.deal(player) }
    puts
    2.times { dealer.deal(dealer) }
  end

  def player_turn
    until player.get_choice == "s"
      dealer.deal(player)
      puts
      puts player.hand_summary
    end
  end
end

# player = Player.new("spencer")
# dealer = Dealer.new("dealer")

# game = Game.new(player, dealer)
# game.play
# binding.pry
