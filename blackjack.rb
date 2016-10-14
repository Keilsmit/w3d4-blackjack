require_relative "deck.rb"
require_relative "card.rb"
require "pry"

class Game

  attr_accessor :dealer_hand, :player_hand,:bj_deck

  def initialize
    self.dealer_hand = []
    self.player_hand = []
    self.bj_deck=Deck.new
    greeting
  end
  # Initialize ends here

  def play
    another_player_deal
  end
  # PLAY METHOD STARTS THE GAME--METHOD ENDS HERE


  def greeting
      puts "Want to play Black Jack (y/n)"
      desire = gets.chomp.downcase
    if desire == "y"
      puts "GREAT!!!!"
      first_deal
    else
      puts "Try again later!"
      exit
    end
  end
  #  GREETING METHOD ENDS HERE

  def first_deal
    2.times do
      player_hand << bj_deck.deal
      dealer_hand << bj_deck.deal
    end
    puts "The Dealer is Showing: #{dealer_hand.first}"
    player_display
    find_player_value
  end
  # TURN METHOD ENDS HERE(show cards in player's hand and returns their value)

  def another_player_deal
    player_hand << bj_deck.deal
    player_display
    puts "Player's has #{player_value}total pts"
    hit_or_stay
  end
  # ANOTHER_DEAL ENDS HERE

  def player_display
    player_hand.each do |card|
      puts "Player 1 is showing: A #{card.face} of #{card.suite}"
    end
      if player_bust
        game_over
      else
        hit_or_stay
      end
  end
  # player_display METHOD ENDS HERE

  def hit_or_stay
    if player_bust
      game_over
    else
      puts "Do you want to 'Hit' or 'Stay'?"
        desire = gets.chomp.downcase
          if desire == "hit"
               another_player_deal
          else
            dealer_game
          end
      game_over
    end
  end
  # HIT_OR_STAY ENDS HERE

  def game_over
    game_outcome
    rematch
  end

  def player_bust
    player_value > 21
  end
  # BUST METHOD ENDS HERE


  def player_value
    player_hand.reduce(0) {|sum, card| sum + card.value}
  end
  # FIND_PLAYER_VALUE GOES HERE


  def player_wins
    puts "Player Wins!"
  end

  def player_lost
    puts "--------Sorry--------Player Lost!!!!!!"
  end


  def blackjack
      puts "!!!Black Jack!!!"
  end





  # COMPUTER_PLAYER LOGIC STARTS BELOW:-------------------------------------
  def dealer_display(full = false)
    if full
      dealer_hand.each do |card|
        puts "Dealer is showing: #{card.face} of #{card.suite}"
      end
    else
      puts "Dealer is showing: #{dealer_hand.first.face} of #{dealer_hand.first.suite}"
    end
  end
  # computer_display METHOD ENDS HERE


  def dealer_game
    until dealer_value > 16 || dealer_value > player_value
      dealer_display(true)
      dealer_hand << bj_deck.deal
    end
      dealer_display(true)
      # exit
  end


  def game_outcome
    if dealer_value > 21
      dealer_bust
    elsif dealer_value == 21
      blackjack
    elsif dealer_value < 21 && dealer_value > player_value
      dealer_won
    elsif player_value == 21
      blackjack
    elsif player_value >21
      player_lost
    elsif player_value >= dealer_value
      player_wins
    else
      player_lost
    end
    rematch
  end

  def dealer_bust
      puts "\nDealer Bust!! \n\n ---------Game Over!!!!!!!!!!!-----------"
  end
  # BUST METHOD ENDS HERE

  def dealer_won
    puts "DEALER WON!!!!\n\n ------------Game Over!!!!!!!!!---------------"
  end


  def dealer_value
    dealer_hand.reduce(0) {|sum, card| sum + card.value}
  end
  # find_computer_value ends here


  # END OF COMPUTER_PLAYER LOGIC----------------------------------------------


  def rematch
    Game.new
  end





end
# Game class ends here

game = Game.new
# binding.pry
