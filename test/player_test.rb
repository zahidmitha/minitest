require 'minitest/autorun'
require './lib/player'
require './lib/tile'
require './lib/property'

class PlayerTest < MiniTest::Unit::TestCase

  def setup
    create_player
  end

  def test_current_position
    pass
  end


  def test_initial_balance
    assert_equal(2000, @player.balance)
  end


  def test_initial_properties_is_empty
    assert @player.properties.empty?
  end

  def test_player_name
    assert_equal("Zahid",@player.name)
  end

  def test_can_afford_property
    assert_equal(true, @player.can_afford_property?(Property.new(1000, "Mayfair")))
  end

  def test_can_not_afford_property
    assert_equal(false, @player.can_afford_property?(Property.new(3000, "Mayfair")))
  end

  def test_property_value_deducted_from_balance_when_bought
    @player.buy_property(Property.new(1000, "Mayfair"))
    assert_equal(1000,@player.balance)
  end

  def test_owns_property_when_property_bought
    property = Property.new(1000, "Mayfair")
    @player.buy_property(property)
    assert @player.owns_property?(property)

  end

  def test_does_not_own_property_when_cannot_afford
      property = Property.new(5000, "Mayfair")
      @player.buy_property(property)
      refute @player.owns_property?(property)

  end

  def test_property_value_not_deducted_from_balance_when_not_bought
    @player.buy_property(Property.new(3000, "Mayfair"))
    assert_equal(2000,@player.balance)
  end

  def test_pays_full_rent
    #property = Property.new(1000, "Mayfair")
    assert_equal 1000, @player.pay_rent(1000)
    assert_equal 1000, @player.balance
  end

  def test_bankrupt_when_can_not_afford_rent
    #property = Property.new(50000, "Mayfair")
    @player.pay_rent(3000)
    assert @player.bankrupt?
  end

  def test_not_bankrupt_when_can_afford_rent
    #property = Property.new(50000, "Mayfair")
    @player.pay_rent(1000)
    refute @player.bankrupt?
  end


  def test_rent_value_deducted_from_balance_when_paid
    @player.pay_rent(1000)
    assert_equal(1000,@player.balance)
  end

  def test_rent_value_deducted_from_remaining_balance
    assert_equal(2000,@player.pay_rent(3000))
  end

  def test_balance_increases_when_rent_received
    @player.receive_rent(50)
    assert_equal(2050, @player.balance)
  end

  private

  def create_player
    @player = Player.new("Zahid")
  end

  def create_property
    @property = Property.new(1000, "Mayfair")
  end

end