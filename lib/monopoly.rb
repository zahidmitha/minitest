require './lib/board'
require './lib/player'
require './lib/tile'
require './lib/property'

begin

  engine = Engine.new
  engine.run

rescue Exception => e
  puts "Sheeeeeeeeit, dog"
  raise e

end