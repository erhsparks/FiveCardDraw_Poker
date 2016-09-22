require 'rspec'
require 'game'

describe Game do
  subject(:game) { Game.new }

  describe "#initialize" do
    it "creates a Player object instance variable" do
      expect(game.current_player).to be_a(Player)
    end

    it "initializes a pot array with value 0" do
      expect(game.pot).to eq(0)
    end

    it "creates new Deck object instance variable" do
      expect(game.deck).to be_a(Deck)
    end
  end
end
