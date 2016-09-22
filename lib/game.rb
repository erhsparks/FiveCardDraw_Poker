require_relative 'player'
require_relative 'deck'

class Game
  attr_reader :current_player, :pot, :deck

  def initialize
    @current_player = Player.new
    @pot = 0
    @deck = Deck.new
  end

end
