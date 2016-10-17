require './card.rb'
# This is the class that makes the deck of cards
class Deck < Array
  # attr_accessor :cards

  def initialize
    suite = %w(Club Spades Heart Diamond)
    face = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    suite.each do |x|
      face.each do |face_variable|
        self << Card.new(face_variable, x)
      end
    end
    shuffle!
    # Loop of cards and suites
  end
  # make_a_deck ends here

  def deal
    shift
  end
end
# Deck class ends here
