class Engine

  def initialize
    @board = Board.new
    # raise @board.inspect
    @die = Dice.new
    @players = []
  end

  # @gamers.players[current_player]

  def run
    create_players
    play
  end

  def create_players
    while true

      break unless player_answers_yes?("would you like to add a player?")

      create_player
    end
  end


  def create_player
    name = get_player_input("What is the player's name?").capitalize
    @players << Player.new(name)
  end


  def play
    @players.cycle do |player|
      unless player.bankrupt?
        do_turn(player)
      end
      test_game_ends
    end
  end

  def do_turn(player)
    move_player(player)
    take_action(player)
  end

  def move_player(player)
    move = Move.new(@board)
    move.execute(player, @die.roll)
  end

  def take_action(player)
    puts "#{player} landed on #{player.current_tile}."

    take_property_action(player, player.current_tile) if player.current_tile.is_a?(Property)

  end

  def take_property_action(player, property)

    if property.available? && player.can_afford_property?(property)
      puts "No-one owns this property"
      offer_property_to(player, property)

    elsif player.owns_property?(property)
      puts "You own this property. Sweet!"
      puts "Your balance is still #{player.balance}"
      puts "You own #{player.properties}."
      puts "------------------------------"

    else
      pay_rent(player, property)
    end

  end

  def offer_property_to(player, property)
    puts "This property generates #{property.rent} every time someone lands on it."
    puts "Your current balance is #{player.balance}."

    if player_answers_yes?("Do you want to buy it?")
      buy_property(player,property)
    else
      puts "Not bought."
      puts "Your balance is still #{player.balance}"
      puts "You still own #{player.properties}."
      puts "------------------------------"
    end

  end

  def buy_property(player,property)

    if player.buy_property(property)
      property.bought
      property.owner = player
      puts "Your balance is now #{player.balance}"
      puts "You now own #{player.properties}."
      puts "------------------------------"
    else
      puts "You're broke-you can't afford it."
      puts "You still own #{player.properties}."
      puts "------------------------------"
    end
  end

  def pay_rent(player, property)
    puts "#{property.owner} owns this property"
    player.pay_rent(property.rent)
    puts "You paid #{property.rent} in rent to them."
    puts "Your balance is now #{player.balance}"
    puts "You own #{player.properties}."
    puts "------------------------------"

  end

  def get_player_input(message)
    puts message
    gets.chomp
  end

  def player_answers_yes?(message)
    get_player_input(message).downcase == "yes"
  end

  def test_game_ends
    @players.reject! { |player| player.bankrupt? }
    if @players.count == 1
      puts "You win! Game over."
      exit
    end
  end

end
