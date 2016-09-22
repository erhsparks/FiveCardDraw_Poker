require 'hand'
require 'rspec'

describe Hand do
  subject(:hand) { Hand.new }
  let(:card1) { double("card1", :suit => :♠, :value => :"10") }
  let(:card2) { double("card2", :suit => :♠, :value => :J) }
  let(:card3) { double("card3", :suit => :♠, :value => :Q) }
  let(:card4) { double("card4", :suit => :♠, :value => :K) }
  let(:card5) { double("card5", :suit => :♠, :value => :A) }

  describe "#initialize" do
    it "creates empty array in instance variable @card" do
      expect(hand.cards).to be_an(Array)
      expect(hand.cards).to be_empty
    end
  end

  describe "#[]" do
    it "returns Hand#cards at given index" do
      expect(hand[0]).to eq(hand.cards[0])
    end
  end

  describe "#add_cards" do
    it "adds a card to an empty hand" do
      hand.add_cards(card3)
      new_hand = hand.cards

      expect(new_hand.size).to eq(1)
      expect(new_hand).to include(card3)
    end

    it "adds a card to a hand with cards in it" do
      hand.add_cards(card1)
      hand.add_cards(card2)
      new_hand = hand.cards

      expect(new_hand.size).to eq(2)
      expect(new_hand).to include(card1)
      expect(new_hand).to include(card2)
    end

    it "adds multiple cards to a hand" do
      hand.add_cards(card1, card2, card5)
      new_hand = hand.cards

      expect(new_hand.size).to eq(3)
      expect(new_hand).to include(card1)
      expect(new_hand).to include(card2)
      expect(new_hand).to include(card5)
    end

    it "does not allow hand to be greater than five cards" do
      hand.add_cards(card1, card2, card3, card4, card5)
      card6 = double("card6", :suit => :♠, :value => :"9")

      expect { hand.add_cards(card6) }.to raise_error
    end
  end

  describe "#discard" do
    before(:each) do
      hand.add_cards(card1, card2, card3, card4, card5)
    end

    it "raises an error if input card is not in hand" do
      expect { hand.delete(card6) }.to raise_error
    end

    it "removes a specific card from hand" do
      hand.discard(card2)
      new_hand = hand.cards

      expect(new_hand.size).to eq(4)
      expect(new_hand).to_not include(card2)
    end

    it "removes multiple cards from hand" do
      hand.discard(card1, card4)
      new_hand = hand.cards

      expect(new_hand.size).to eq(3)
      expect(new_hand).to_not include(card1)
      expect(new_hand).to_not include(card4)
    end
  end

  describe "#winning_hand" do
    before(:each) do
      hand.add_cards(card1, card2, card3, card4, card5)
    end

    let(:possible_values) { Hand::ALPHABET }

    before(:each) do
      @best = hand.winning_hand

      @winning_move = @best.first
      @card_hash = @best.last

      @card_values = @card_hash.keys
      @card_suits = @card_hash.values
    end

    it "returns an array" do
      expect(@best).to be_an(Array)
    end

    it "the first element of output is a symbol" do
      expect(@winning_move).to be_a(Symbol)
    end

    it "the last element of the output is a hash" do
      expect(@card_hash).to be_a(Hash)
    end

    it "hash keys are card values" do
      expect(@card_values.all? { |k| possible_values.include?(k) }).to be true
    end

    it "hash values are arrays of suits" do
      expect(@card_suits.all? { |v| v.is_a?(Array) }).to be true
    end
  end
end
