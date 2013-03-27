
class Tile

  attr_reader :name


  def initialize(name)
    @name = name
    @purchasable = true
  end

  def purchasable?
    @purchasable
  end


end