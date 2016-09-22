require 'hand'
require 'rspec'

describe Hand do
  subject(:hand) { Hand.new }
  before(:each) do
    @card1 = double("card1", :suit => :♠, :value => :"10")
    @card2 = double("card2", :suit => :♠, :value => :J)
    @card3 = double("card3", :suit => :♠, :value => :Q)
    @card4 = double("card4", :suit => :♠, :value => :K)
    @card5 = double("card5", :suit => :♠, :value => :A)
  end

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
    it "adds one card to hand"

    it "adds multiple cards to hand"
  end

  describe "#discard" do
    before(:each) do
      hand.add_cards(@card1, @card2, @card3, @card4, @card5)
    end

    it "removes a specific card from hand" do
      hand.discard(@card2)
      next_hand = hand.cards

      expect(next_hand).to_not include(@card2)
      expect(next_hand.size).to eq(4)#be < (@before_hand.size)
    end

    it "removes multiple cards from hand" do
      hand.discard(@card1, @card4)
      final_hand = hand.cards

      expect(final_hand).to_not include(@card1)
      expect(final_hand).to_not include(@card4)
      expect(final_hand.size).to eq(3)#be < (@next_hand.size)
    end
  end

  describe "#winning_hand" do
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
