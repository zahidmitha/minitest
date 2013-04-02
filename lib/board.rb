class Board

  def initialize
    @properties = []
    create_properties
  end

  def properties
    @properties
  end

  private

  def property(value, name)
    @properties << Property.new(value, name)
  end

  def create_properties
    property(60, "Old Kent Road")
    property(60, "Whitechapel")
    property(100, "Angel")
    property(100, "Euston")
    property(120, "Pentonville Road")
    property(140, "Pall Mall")
    property(140, "Whitehall")
    property(160, "Northumberland Avenue")
    property(180, "Bow Street")
    property(180, "Marlborough Street")
    property(200, "Vine Street")
    property(220, "The Strand")
    property(220, "Fleet Street")
    property(240, "Trafalgar Square")
    property(260, "Leicester Square")
    property(260, "Coventry Street")
    property(280, "Piccadilly")
    property(300, "Oxford Street")
    property(300, "Regent Street")
    property(320, "Bond Street")
    property(350, "Park Lane")
    property(400,"Mayfair")
  end

end

