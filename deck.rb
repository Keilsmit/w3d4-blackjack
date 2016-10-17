require './card.rb'

class Deck
  attr_accessor :cards

  def initialize
    make_a_deck
    shuffle
  end
  # Initialize ends here

  def make_a_deck
    suite = %w(Club Spades Heart Diamond)
    face = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    self.cards = []

    suite.each do |x|
      face.each do |face_variable|
        cards << Card.new(face_variable, x)
      end
    end
    # Loop of cards and suites
  end
  # make_a_deck ends here

  def shuffle
    cards.shuffle!
  end

  def deal
    cards.shift
  end
end
# Deck class ends here
