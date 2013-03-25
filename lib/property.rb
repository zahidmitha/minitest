
class Property
	def initialize
		@available = true
	end

	def available?
		@available
	end

	def bought
		@available = false
	end

end