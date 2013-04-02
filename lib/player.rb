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
    return false unless self.can_afford_property?(property)
      @balance -= property.value
      @properties << property
  end

  def pay_rent(rent)
    if @balance >= rent
       @balance -= rent
       rent
    else
       @bankrupt = true
       paid = @balance
       @balance = 0
       paid
    end
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

  def view_balance
    "#{@balance}"
  end

  def to_s
    "#{@name}"
  end

  def owned_properties

  end

  def bankrupt?
    @bankrupt
  end


end
