class Player

  attr_accessor :balance, :current_position
  attr_reader :properties, :name

  def initialize(name)
    @balance = 2000
    @properties = []
    @name = name
    @current_position = 0
  end

  def buy_property(property)
    if self.can_afford_property?(property)
      @balance -= property.value
      @properties << property
    end
  end

  def pay_rent(rent)
    return false unless @balance >= rent
    @balance -= rent
  end

  def owns_property?(property)
    @properties.include?(property)
  end

  def receive_rent(rent)
      @balance += rent
  end

  def can_afford_property?(property)
    @balance >= property.value
  end


end
