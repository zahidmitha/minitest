require './lib/tile'

class Property < Tile

  attr_accessor :owner
	attr_reader :value

  def initialize(value, name)
		@available = true
    @value = value
    super(name)
	end

	def available?
		@available
	end

	def bought
		@available = false
	end

  def rent
    @value * 5/100
  end

end





#@property = Property.new(100)
#puts @property.value