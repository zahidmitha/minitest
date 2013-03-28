require 'minitest/autorun'
require './lib/board'
require './lib/player'
require './lib/tile'
require './lib/property'
require './lib/move'

class MoveTest < MiniTest::Unit::TestCase

  def test_position_after_movement
    player = Player.new("Zahid")
    board = Board.new
    move = Move.new(board)
    die_roll = 5
    new_property = move.execute(player, die_roll)

    assert_equal(die_roll, player.current_position)
    assert_equal(board.properties[die_roll], new_property)
    refute_nil new_property
  end

    def test_position_after_the_end_of_the_board
      player = Player.new("Zahid")
      board = Board.new
      move = Move.new(board)
      player.current_position = board.properties.count - 1
      die_roll = 5
      move.execute(player, die_roll)

      assert_equal(4,player.current_position)

    end

end