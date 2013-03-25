require 'minitest/autorun'
require './lib/property'
class PropertyTest < MiniTest::Unit::TestCase

	def setup
		create_property
	end

	def test_available_when_initialize
        assert @property.available? #assert is the same as assert_equal true, "something"
	end

	def test_unavailable_when_bought
		@property.bought
		refute @property.available?
	end

	private

	def create_property
		@property = Property.new
	end
end