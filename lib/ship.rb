class Ship
  attr_reader :name,
              :length,
              :ship_health

  def initialize(name, length)
    @name   = name
    @length = length
    @ship_health = 3
  end

  def sunk?
    if @ship_health > 0
      false
    else
      true
    end
  end

  def hit
    @ship_health -= 1
  end
end
