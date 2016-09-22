require 'deck'
require 'rspec'

describe Deck do
  subject(:deck) { Deck.new }
  let(:pack) { deck.pack }

  describe "#initialize" do
    it "returns a new deck object" do
      expect(deck).to be_a(Deck)
    end

    it "populates deck with 52 playing cards" do
      expect(deck.pack.count).to eq(52)
    end

    it "populates deck with the standard playing card deck" do
      expect(pack.shuffle).to_not eq(pack)
    end
  end

  describe "#shuffle" do
    before(:each) do
      @pack1 = deck.pack
      
      deck.shuffle
      @pack2 = deck.pack
    end

    it "shuffles Deck#pack" do
      expect(@pack2).to_not eq(@pack1)
    end
  end

  describe "#deal" do
    before(:each) { @hand = deck.deal(5) }

    it "removes correct number from beginning of deck" do
      expect(deck.pack.size).to eq(47)
    end

    it "returns an array of correct length" do
      expect(@hand).to be_an(Array)
      expect(@hand.size).to eq(5)
    end

    it "returned array contains all Card objects" do
      expect(@hand.all? { |card| card.is_a?(Card) }).to be true
    end
  end

  describe "#discard" do
    let(:new_card) { double("card") }

    before(:each) do
      @before_pack = deck.pack

      deck.discard(new_card)
      @after_pack = deck.pack
    end

    it "adds cards to end of the deck" do
      before_last = @before_pack.last
      after_last = @after_pack.last

      expect(after_last).to_not eq(before_last)
    end

    it "increase pack size by discard num" do
      before_size = @before_pack.size
      after_size = @after_pack.size

      expect(after_size).to_not eq(before_size)
    end
  end
end
