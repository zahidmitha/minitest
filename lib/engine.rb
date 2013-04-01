# require 'minitest/autorun'
require './lib/board'
require './lib/player'
require './lib/tile'
require './lib/property'
require './lib/dice'
require './lib/move'

class Engine

  attr_reader :player1
  attr_reader :player2


  def initialize
    create_players
    @board = Board.new
    @die = Dice.new



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

    puts "The game begins! #{@player1} has a balance of #{@player1}.view_balance. /n
    #{@player2} has a balance of #{@player2.balance}"

  end

  def decide_player



  end



  def players_move(player)
    @move = Move.new(@board)
    turn = @move.execute(player,@die.roll)
    @current_position = player.current_position

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

  def which_property(player)
    @property = @board.properties[player.current_position]
    @property
  end

  def action_on_land(player)
     puts "You have landed on #{@current_position}."
    if @property.available?
      puts "No-one owns this property"
      choice_to_buy
    elsif player.owns_property?(@property)
      puts "You own this property. Sweet!"
    else
      puts "PLACEHOLDER owns this property"
    end
  end

  def choice_to_buy
      puts "Do you want to buy it?"
      answer = gets.chomp
      if answer == "yes"
        puts "bought"
      else
        puts "not bought"
      end
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

engine.players_move(engine.player1)
engine.which_property(engine.player1)
engine.action_on_land(engine.player1)
engine.choice_to_buy