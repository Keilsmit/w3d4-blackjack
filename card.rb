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
    if face == "A"
      self.value = 11
    elsif face == "K"
      self.value = 10
    elsif face == "Q"
      self.value = 10
    elsif face == "J"
      self.value = 10
    else
      self.value = face.to_i
    end
  end









end
# Card CLASS ends HERE--
