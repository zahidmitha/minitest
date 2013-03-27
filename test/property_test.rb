require 'minitest/autorun'
require './lib/tile'
require './lib/property'

class PropertyTest <MiniTest::Unit::TestCase

	def setup
		create_property
	end

	def test_available_when_initialized
    assert @property.available? #assert is the same as assert_equal true, "something"
	end

	def test_unavailable_when_bought
		@property.bought
		refute @property.available?
	end

	def test_calculate_rent
		assert_equal 5, @property.rent
	end

	def test_value_when_initialized
		assert_equal(100, @property.value)
	end

	def test_name_when_initialized
		assert_equal("Mayfair", @property.name)
	end

	private

	def create_property
		@property = Property.new(100, "Mayfair")
	end

end



