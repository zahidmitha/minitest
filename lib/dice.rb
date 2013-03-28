class Dice

  def initialize

  end

  def roll
    random = Random.new
    @die_roll = random.rand(1..6)
  end

end