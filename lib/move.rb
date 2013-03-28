class Move

  def initialize(board)
    @board = board
  end

  def execute(player, die_roll)
    player.current_position = (player.current_position + die_roll) % @board.properties.count
    @board.properties[player.current_position]

  end


end

    # decide_player
    # get_current_position
    # roll_dice
    # move_player_from_current_position
    # update_current_position
    # get_current_tile
    # is_owned?
    # by whom?
    #   pay_rent
    # can_buy
    #   buy?
