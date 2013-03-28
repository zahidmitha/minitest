# require 'minitest/autorun'
require './lib/board'
require './lib/player'
require './lib/tile'
require './lib/property'
require './lib/dice'
require './lib/move'

class Engine

  def initialize
    create_players
    decide_player



  end

  def run
     10.times do
     end
  end

  def create_players
     puts "What is player 1's name?"
     name1 = gets.chomp

    @player1 = Player.new(name1)

    puts "What is player 2's name?"
    name2 = gets.chomp

    @player2 = Player.new(name2)

    @player1.current_position = 0
    @player2.current_position = 0

  end

  def decide_player
    @board = Board.new


  end



  def players_move
    move = Move.new(@board)
    die = Dice.new
    turn = move.execute(@player1,die.roll)
    puts @player1.current_position

    #puts "you have landed on property do you want to buy"

    # decision = gets



    # decide_player
    # get_current_position
    # roll_dice
    # move_player_from_current_position
    # update_current_position
    # get_current_tile
    # is_owned?
    #   pay_rent
    # can_buy
    # buy?

  end

  def land_on_properties
  end

  def when_to_pay_rent
  end

  def when_to_buy
  end

  def choice_to_buy
  end

  def game_ends
  end


end

# Player is on a position
#Players move around the board
#Players land on properties
#Players pay rent where they land
#Dice are rolled before each move
#Dice rolls determine how far players move
# One for the player (maybe): Bankruptcy


engine = Engine.new

engine.players_move