class Cell
  attr_reader :coordinate, ship
  def initialize (coordinate)
    @coordinate = coordinate
    @ship = []
  end

  def ship
    ship.count(coordinate)
  end

  

end
