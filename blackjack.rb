require_relative 'deck.rb'
require_relative 'card.rb'
require 'pry'
# This class has game logic and runs game
class Game
  attr_accessor :dealer_hand, :player_hand, :bj_deck

  def initialize
    self.dealer_hand = []
    self.player_hand = []
    self.bj_deck = Deck.new
    greeting
  end
  # Initialize ends here

  def play
    another_player_deal
  end
  # PLAY METHOD STARTS THE GAME--METHOD ENDS HERE

  def greeting
    puts "\nWant to play Black Jack (y/n)"
    desire = gets.chomp.downcase
    if desire == 'y'
      puts "\nDealer's first card:"
      first_deal
    else
      puts 'Thanks for Playing'
      exit
    end
  end
  #  GREETING METHOD ENDS HERE

  def first_deal
    2.times do
      player_hand << bj_deck.deal
      dealer_hand << bj_deck.deal
    end
    puts "#{dealer_hand.first}\n"
    player_display
    find_player_value
  end
  # TURN METHOD ENDS HERE(show cards in player's hand and returns their value)

  def another_player_deal
    game_outcome
    player_hand << bj_deck.deal
    # player_display
    puts "\n\nPlayer current points total:\n #{player_value}pts"
    player_display
    hit_or_stay
  end
  # ANOTHER_DEAL ENDS HERE

  def player_display
    player_hand.each do |card|
      puts "\nThe Player is showing:\n  #{card.face} of #{card.suite}"
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
      puts "\nDo you want to 'Hit' or 'Stay'?"
      desire = gets.chomp.downcase
      if desire == 'hit'
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
    player_hand.reduce(0) { |sum, card| sum + card.value }
  end
  # FIND_PLAYER_VALUE GOES HERE

  def player_wins
    puts "\n\n Player Wins!"
  end

  def player_lost
    puts "\n\n You Lost!"
  end

  def bust_display
    puts "\n\n Player Bust!"
  end

  def blackjack
    puts "\n\n BLACK JACK!"
  end

  # COMPUTER_PLAYER LOGIC STARTS BELOW:-------------------------------------
  def dealer_display(full = false)
    if full
      dealer_hand.each do |card|
        puts "\n Dealer is showing: \n  #{card.face} of #{card.suite}\n"
      end
    else
      puts "\nDealer is showing:
      \n  #{dealer_hand.first.face} of #{dealer_hand.first.suite}\n"
    end
  end
  # computer_display METHOD ENDS HERE

  def dealer_game
    until dealer_value > 16 || dealer_value > player_value || dealer_value == 21
      dealer_display(true)
      dealer_hand << bj_deck.deal
    end
    dealer_display(true)
  end

  def game_outcome
    if dealer_value > 21
      dealer_bust
    elsif dealer_value == 21
      blackjack
      dealer_won
    elsif dealer_value < 21 && dealer_value > player_value
      dealer_won
    elsif player_value == 21
      blackjack
      player_wins
    elsif player_value > 21
      bust_display
    elsif player_value >= dealer_value
      player_wins
    elsif player_value < 21 && player_hand >= 6
      player_wins
    elsif player_value == dealer_value && player_hand.length >=
          dealer_hand.length
      player_wins
    elsif dealer_value == player_value && dealer_hand.length > player_hand.length
      dealer_won
    else
      player_lost
    end
    rematch
  end

  def dealer_bust
    puts "\n\n DEALER BUST!"
  end
  # BUST METHOD ENDS HERE

  def dealer_won
    puts "\n\n DEALER WON!"
  end

  def dealer_value
    dealer_hand.reduce(0) { |sum, card| sum + card.value }
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
