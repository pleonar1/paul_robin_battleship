require './lib/ship'
require './lib/cell'
require './lib/board'

class ComputerSetup
  attr_reader :comp_board

  def initialize
    @comp_board   = Board.new
  end


  def place_computer_ship(ship)
    computer_ship_placements = []
    (ship.length).times do |placement|
      placement = (('A'..'D').to_a.sample + rand(1..4).to_s)
      computer_ship_placements << placement
    end
    if @comp_board.valid_placement?(ship, computer_ship_placements) == true
      @comp_board.place(ship, computer_ship_placements)


    else
      place_computer_ship(ship)
    end
  end
end
