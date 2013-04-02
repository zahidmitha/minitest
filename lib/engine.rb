class Engine

  def initialize
    @board = Board.new
    # raise @board.inspect
    @die = Dice.new
    @gamers = Gamers.new
  end

  # @gamers.players[current_player]

  def run
    create_players
    play
  end

  def create_players
    play = false
    while play == false do
      puts "would you like to add a player?"
      answer = gets.chomp.downcase
      if answer == "yes"
        puts "What is the player's name?"
        name = gets.chomp.capitalize
        @gamers.create_player(Player.new(name))
        play = false
      else
        play = true
      end
      # puts "The game begins! #{@player1} has a balance of #{@player1.view_balance} \n
      # #{@player2} has a balance of #{@player2.balance}"
    end
  end

  def play
    @gamers.players.cycle do |player|
      player_actions(player)
      next if player.bankrupt?
      game_ends
    end

  end

  def player_actions(player)
    players_move(player)
    which_property(player)
    action_on_land(player)
  end

  def players_move(player)
    @move = Move.new(@board)
    turn = @move.execute(player,@die.roll)
    @current_position = player.current_position
  end

  def which_property(player)
    @current_property = @board.properties[player.current_position]
  end

  def action_on_land(player)
    puts "#{player} landed on #{@current_property}."
    if @current_property.available?
      puts "No-one owns this property"
      choice_to_buy(player)
    elsif player.owns_property?(@current_property)
      puts "You own this property. Sweet!"
      puts "Your balance is still #{player.balance}"
      puts "You own #{player.properties}."
      puts "------------------------------"
    else
      puts "#{@current_property.owner} owns this property"
      player.pay_rent(@current_property.rent)
      puts "You paid #{@current_property.rent} in rent to them."
      puts "Your balance is now #{player.balance}"
      puts "You own #{player.properties}."
      puts "------------------------------"
    end
  end

  def choice_to_buy(player)
    puts "This property generates #{@current_property.rent} every time someone lands on it."
    puts "Your current balance is #{player.balance}."
    puts "Do you want to buy it?"
    answer = gets.chomp
    if answer == "yes"
      if player.buy_property(@current_property)
        @current_property.bought
        @current_property.owner = player
        puts "Your balance is now #{player.balance}"
        puts "You now own #{player.properties}."
        puts "------------------------------"
      else
        puts "You're broke-you can't afford it."
        puts "You still own #{player.properties}."
        puts "------------------------------"
      end
    else
      puts "Not bought."
      puts "Your balance is still #{player.balance}"
      puts "You still own #{player.properties}."
      puts "------------------------------"
    end
  end

  def game_ends
      if @gamers.players.count == 1
        puts "You win! Game over."
        exit
      end
  end

end
