require_relative 'hand'
require 'colorize'

class Player
  attr_reader :name, :hand, :chips

  def initialize
    if __FILE__ == $PROGRAM_NAME
      print "Welcome! Enter your name: "
      @name = gets.chomp
    else
      @name = "Player One"
    end

    @hand = []
    @chips = 100
  end

  def play_turn
    puts "New deal..."

    @chips -= 5 # this is high limit!
    puts "#{@chips} chips left"
  end

  def receive_card(card)
    @hand << card
  end

  def cards_to_discard
    display_cards

    puts "Which cards would you like to discard?"
    puts "Choose a card by entering the green number below it."
    puts "You may choose up to two cards."
    puts "If you would not like to discard any, enter 0."

    print "First card: "
    card1 = gets.chomp.to_i

    print "Second card: "
    card2 = gets.chomp.to_i

    ###error handling here blah

    [card1, card2].delete(0)
  end

  def take_action
    ### ask if player wants to fold, see, raise
    ### adjust their chips accordingly
  end

  def recieve_winnings(amount)
    @chips += amount
  end

  private
  def display_cards
    @hand.each do |card|
      suit, value = card.to_s

      print "[ #{value}#{suit} ] "
    end
    puts
    puts "  1   2   3   4   5  ".green
  end
end
