class Gamers

  attr_reader :players

  def initialize

    @players = []

  end

  def create_player(player)

    @players << player

  end


end