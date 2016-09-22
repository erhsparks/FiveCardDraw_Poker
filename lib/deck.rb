require_relative 'card'

class Deck
  attr_reader :pack

  def initialize
    @pack = []
    make_pack
  end

  def shuffle
    @pack = @pack.shuffle
  end

  def deal(num_cards)
    @pack.shift(num_cards)
  end

  def discard(*cards)
    @pack += cards 
  end

  private
  def make_pack
    SUITS.each do |suit|
      VALUES.each do |value|
        @pack << Card.new(suit, value)
      end
    end

    shuffle
  end

  VALUES = %i(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = %i(♠ ♥ ♦ ♣)
end
