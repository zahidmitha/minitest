require 'minitest/autorun'
require './lib/board'
# require './lib/player'
require './lib/tile'
require './lib/property'

class EngineTest < MiniTest::Unit::TestCase

#Tiles:
#Where
#List of properties

def setup
  @board = Board.new

end

def test_last_tile_is_mayfair
  assert_equal("Mayfair", @board.properties.last.name)
end

def test_first_tile_is_old_kent_road
  assert_equal("Old Kent Road", @board.properties.first.name)
end

# def test_seventh_property_is_whitehall
#   assert_equal("Whitehall", @board.properties[6].name)
# end

def check_properties_exist_when_board_created
  assert @board

end

end