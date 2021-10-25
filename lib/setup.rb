require './lib/ship'
require './lib/cell'
require './lib/board'

class Setup
  attr_reader :player, :player_placements

    def initialize(player)

    @player             = player
    @player_placements  = []



  end

  def place_ships
    @board
    puts "Enter the squares for the Cruiser (3 spaces):"
    (@ship.length).times do |i|
      puts "Position #{i + 1}: "
      ship_placement = gets.chomp.to_s.upcase
        if @board.valid_placement?(@cruiser, ship_placement) == false
          puts "Please enter a valid placement."
          place_ships
        elsif ship_placement == "!"
            end_program
        else
      end
    player_placements << ship_placement
    player_placements
    end
  end

  def end_program
    puts "Thanks for playing."
  end
end
