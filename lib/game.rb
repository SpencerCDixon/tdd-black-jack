require_relative 'player'
require_relative 'dealer'
require 'pry'

class Game
  attr_reader :player, :dealer
  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @rounds = 0
  end

  def play
    welcome_screen if @rounds == 0
    start_round
    player_turn

    @rounds += 1
  end

  def welcome_screen
    puts <<-EOH
############################################
## Welcome to Black Jack!                 ##
## Some more rules and stuff will go here ##
############################################

    EOH
  end

  def start_round
    2.times do
      dealer.deal(player)
      dealer.deal(dealer)
    end
    puts
    puts player.hand_summary
  end

  def player_turn
    until player.get_choice == "s"
      dealer.deal(player)
      check_bust
      puts player.hand_summary
    end
  end

  def check_bust
    if player.hand.total_score > 21
      puts "You bust."
      play
    end
  end
end

player = Player.new("spencer")
dealer = Dealer.new("dealer")
game = Game.new(player, dealer)
game.play
