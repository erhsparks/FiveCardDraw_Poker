require 'hand'
require 'rspec'

describe Hand do
  subject(:hand){Hand.new}

  describe "#initialize" do
    it "creates empty array in instance variable @card" do
      expect(hand.cards).to be_empty
    end
  end

  describe "#[]" do
    it "returns hand.cards at input index" do
      expect(hand[0]).to eq(hand.cards[0])
    end
  end

  describe "#discard" do
    it "removes requested cards from hand" do
      prev_hand = hand.cards
      hand.discard()
      expect(hand.discard)
    end
  end

  describe "#add_cards" do

  end

  describe "#winning_hand" do
    before(:each) do
      @best = hand.winning_hand
    end

    it "returns an array" do
      expect(@best).to be_an(Array)
    end

    it "the first element of output is a symbol" do
      expect(@best.first).to be_a(Symbol)
    end

    it "the last element of the output is an array" do
      expect(@best.last).to be_an(Array)
    end

    it "inner array contains all Cards" do
      expect(@best.last.all?{|card| card.is_a?(Card)}).to be true
    end
  end
end
