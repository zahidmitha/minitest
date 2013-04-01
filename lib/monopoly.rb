require './lib/board'
require './lib/player'
require './lib/tile'
require './lib/move'
require './lib/dice'
require './lib/property'
require './lib/engine'

#begin

  engine = Engine.new
  engine.run

# rescue Exception => e
#   puts "Sheeeeeeeeit, son"
#   raise e

# end