require_relative 'player'
require_relative 'dealer'

class Game
  attr_reader :player, :dealer
  def initialize(player)
    @player = player
    @dealer = Dealer.new("dealer")
    @round_num = 0
  end

  def play
    @round_num += 1
    puts welcome_screen if @round_num == 1
    start_round
    player_turn
    dealer_turn
    puts check_winner
    play_again?
  end

  def start_round
    2.times do
      dealer.deal(player)
      dealer.deal(dealer)
      puts
    end
    puts player.hand_summary
    puts dealer.hand_summary
    puts
  end

  def player_turn
    until player.get_choice == "s"
      dealer.deal(player)
      check_bust(player)
      puts player.hand_summary
    end
  end

  def dealer_turn
    until dealer.hand.total_score >= 17
      dealer.deal(dealer)
      check_bust(dealer)
      puts dealer.hand_summary
    end
  end

  def check_bust(person)
    if person.total_score > 21
      puts bust_message(person)
      play_again?
    end
  end

  def clear_cards
    player.cards.clear
    dealer.cards.clear
  end

  def check_winner
    if player.total_score > dealer.total_score && player.total_score < 22
      "#{player.name} wins!"
    else
      "Dealer wins :("
    end
  end

  def play_again?
    clear_cards
    decision = player.play_again?
    play if decision == "y"
  end

  private

  def bust_message(person)
    %Q{

===============================
  #{person.name} busts. Round: #{@round_num}
===============================

    }
  end

  def welcome_screen
    %Q{
############################################
      Welcome to Black Jack #{player.name}!
############################################

    }
  end
end
