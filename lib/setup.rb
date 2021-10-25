require './lib/ship'
require './lib/cell'
require './lib/board'

class Setup
  attr_reader :player

    def initialize(player)

    @player = player
    @player_placements = []


  end

  def place_ship(@ship.name)
    @ship.length.times do
      ship_placement = gets.chomp.to_s.upcase
        if @board.valid_placement?(@ship.name, ship_placement) == false
          puts "Please enter a valid placement."
          place_ship(@ship.name)
        elsif cruiser_placement == "!"
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
