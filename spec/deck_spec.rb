require 'deck'
require 'rspec'
require 'byebug'

describe Deck do
  subject(:deck) {Deck.new}
  before(:each) do
    @pack1 = deck.pack
    deck.shuffle
    @pack2 = deck.pack
  end

  describe "#initialize" do
    it "returns a new deck object" do
      expect(deck).to be_a(Deck)
    end

    it "populates deck with shuffled playing cards" do
      expect(deck.pack.count).to eq(52)
      expect(@pack2).to_not eq(@pack1)
    end
  end

  describe "#shuffle" do
    it "shuffles Deck#pack" do

      expect(@pack1).to_not eq(@pack2)
    end
  end

  describe "#deal" do
    before(:each) { @hand = deck.deal(5) }

    it "removes correct number from top of deck" do
      expect(deck.pack.size).to eq(47)
    end

    it "returns an array of correct length" do
      expect(@hand.size).to eq(5)
      expect(@hand.all? { |card| card.is_a?(Card) }).to be true
    end
  end

  describe "#describe" do
    it "adds cards to bottom of the deck" do
      old_first = deck.pack.first
      deck.discard([Card.new(:♠,:"4")])
      new_first = deck.pack.first
      expect(new_first).to_not eq(old_first)
    end

    it "increase pack size by discard num" do
      orig_size = deck.pack.size
      deck.discard([Card.new(:♠,:"4")])
      expect(deck.pack.size).to_not eq(orig_size)
    end
  end
end
