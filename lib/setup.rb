require './lib/ship'
require './lib/cell'
require './lib/board'

class Setup
  attr_reader :player, :player_placements, :board

    def initialize(player)

    @player           = player
    @board            = Board.new
    @comp_board       = Board.new
    @cruiser          = Ship.new("Cruiser", 3)
    @submarine        = Ship.new("Submarine", 2)


  end

  def place_ships(ship)
    puts @board.render(true)
    @player_placements  = []
    puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
    (ship.length).times do |i|
      puts "Position #{i + 1}: "
      ship_placement = gets.chomp.to_s.upcase

      player_placements << ship_placement
      end



    if @board.valid_placement?(ship, player_placements) == true
      puts "Nice! Your #{ship.name} has been placed!"
      @board.place(ship, player_placements)

      puts "=============COMPUTER BOARD============="
      puts @comp_board.render

    else
      puts "Invalid input. Please try again."
      place_ships(ship)
    end
  end

  def end_program
    puts "Thanks for playing."
  end
end
