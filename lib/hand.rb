require_relative 'card'

class Hand
  attr_reader :cards, :contents

  def initialize
    @cards = []
  end

  def [](index)
    @cards[index]
  end

  def add_cards(*new_cards)
    raise "your hand is already full!" if @cards.length == 5

    new_cards.each do |card|
      if @cards.length < 5
        @cards << card
      else
        raise "cannot add any more cards; hand is full!"
      end
    end

    hand_contents
  end

  def discard(*bye_cards)
    bye_cards.each do |card|
      raise "card not found!" unless @cards.include?(card)

      @cards.delete(card)
    end
  end

  def winning_hand
    [best_hand_type, @contents]
  end

  def best_hand_type
    return :royal_flush if royal_flush?
    return :straight_flush if straight_flush?
    return :four_of_a_kind if four_of_a_kind?
    return :full_house if full_house?
    return :flush if flush?
    return :straight if straight?
    return :three_of_a_kind if three_of_a_kind?
    return :two_pair if two_pair?
    return :pair if pair?

    :high_card
  end

  def hand_contents
    @contents = {}

    @cards.each do |card|
      value, suit = card.value, card.suit
      if @contents.keys.include?(value)
        @contents[value] << suit
      else
        @contents[value] = [suit]
      end
    end

    @contents
  end

  def pair?
    @contents.any? { |k, v| v.length == 2 }
  end

  def two_pair?
    @contents.keys.length == 3
  end

  def three_of_a_kind?
    @contents.any? { |k, v| v.length == 3 }
  end

  def straight?
    if @contents.keys.length == 5
      sorted = @contents.keys.sort_by {|key| ALPHABET.index(key)}

      (0..ALPHABET.length-5).any? { |i| ALPHABET[i...i+5] == sorted }
    else
      false
    end
  end

  def flush?
    @contents.values.uniq.length == 1
  end

  def full_house?
    @contents.keys.length == 2
  end

  def four_of_a_kind?
    @contents.any? { |k, v| v.length == 4 }
  end

  def straight_flush?
    straight? && flush?
  end

  def royal_flush?
    straight? && flush? &&
          @contents.keys.all? {|key| ALPHABET.index(key) > 7}
  end

  # ALPHABET = Deck::VALUES
  ALPHABET = %i(2 3 4 5 6 7 8 9 10 J Q K A)
end
