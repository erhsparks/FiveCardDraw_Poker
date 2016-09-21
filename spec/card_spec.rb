require 'rspec'
require 'card'

describe Card do
  let(:suit) {:♣}
  let(:value) {:"4"}
  subject(:card) {Card.new(suit,value)}

  describe "#initialize" do
    it "creates a new instance of card with given suit and value" do
      expect(card).to be_a(Card)
      expect(card.suit).to eq(suit)
      expect(card.value).to eq(value)
    end
  end

  describe "#to_s" do
    it "returns an array containing [suit, value]" do
      expect(card.to_s).to eq([suit.to_s, value.to_s])
    end
  end
end
