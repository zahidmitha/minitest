require 'minitest/autorun'
require './lib/tile'

class TileTest < MiniTest::Unit::TestCase

  def setup
    create_tile
  end

  def test_name_when_initialized
    assert_equal("Old Kent Road", @tile.name)
  end

  def test_purchasable_when_initialized
    assert @tile.purchasable?
  end

  private

  def create_tile
    @tile = Tile.new("Old Kent Road")
  end

end