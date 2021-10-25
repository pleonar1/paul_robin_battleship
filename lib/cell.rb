require './lib/ship'

class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon,
              :health

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

  def render(reveal = false)
    if @fired_upon == true && empty? == true
      "M"
    elsif reveal == true && @ship != nil
      "S"
    elsif @fired_upon == true && @health == 0 && empty? == false
      "H"
      if ship.sunk? == true
      "X"
      else
      "H"
    end
    else
      "."
    end
  end
end
