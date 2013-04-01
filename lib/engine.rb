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
    create_players()
    play()
  end

  def create_players
     puts "What is player 1's name?"
     name1 = gets.chomp

    @player1 = Player.new(name1)

    puts "What is player 2's name?"
    name2 = gets.chomp

    @player2 = Player.new(name2)

    puts "The game begins! #{@player1} has a balance of #{@player1.view_balance} \n
    #{@player2} has a balance of #{@player2.balance}"
  end

  def play
     10.times do turns
     end
  end

  def turns
    player_actions(@player1)
    player_actions2(@player2)
  end

  def player_actions(player)
    players_move(@player1)
    which_property(@player1)
    action_on_land(@player1)
    choice_to_buy(@player1)
    game_ends
    player_actions2(@player2)

  end

  def player_actions2(player)
    players_move(@player2)
    which_property(@player2)
    action_on_land(@player2)
    choice_to_buy(@player2)
    player_actions(@player1)
    game_ends
  end

  def players_move(player)
    @move = Move.new(@board)
    turn = @move.execute(player,@die.roll)
    @current_position = player.current_position
  end

  def which_property(player)
    @property = @board.properties[player.current_position]
    @property
  end

  def action_on_land(player)
     puts "You have landed on #{@current_position}."
    if @property.available?
      puts "No-one owns this property"
      choice_to_buy(player)
    elsif player.owns_property?(@property)
      puts "You own this property. Sweet!"
    else
      puts "#{@property.owner} owns this property"
      player.pay_rent
      puts "Your balance is now #{player.balance}"
    end
  end

  def choice_to_buy(player)
      puts "This property generates #{@property.rent} every time someone lands on it."
      puts "Do you want to buy it?"
      answer = gets.chomp
      if answer == "yes"
        player.buy_property
        @property.bought
        puts "Your balance is now #{player.balance}"
        puts "You own #{@property}"
      else
        puts "Not bought."
        puts "Your balance is still #{player.balance}"
      end
  end

  def game_ends
    @player.bankrupt
    exit
  end

end
