# This is the class that makes the cards
class Card
  attr_accessor :face, :suite, :value

  def initialize(face, suite)
    self.face = face
    self.suite = suite
    card_value
  end

  def to_s
    "the #{@face} of #{@suite}"
  end

  def card_value
    self.value =  if %w(J Q K).include? face
                    10
                  elsif face == 'A'
                    11
                  else
                    face.to_i
                  end
  end
end
# Card CLASS ends HERE--
