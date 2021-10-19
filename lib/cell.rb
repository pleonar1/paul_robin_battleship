require './lib/ship'

class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship       = nil
    @fired_upon = false #Eventually, will likely become an hash of cells ----- ex: {"A1" = true, "A2" = false}
    @health     = 1
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if empty? == false
      @health = 0
    end
  end

  def render
    if @fired_upon == true && empty? == true
      "M"
    elsif @fired_upon == true && @health == 0
      "H"
    elsif @fired_upon == true && @health == 0 && ship.ship_health == nil
      "X"
    else
      "."
    end
  end
end
