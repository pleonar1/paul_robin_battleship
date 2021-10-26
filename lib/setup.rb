require './lib/ship'
require './lib/cell'
require './lib/board'

class Setup
  attr_reader :board, :player_placements

  def initialize
    @board      = Board.new
    @comp_board = Board.new
  end

  def place_ships(ship)
    puts "==============PLAYER BOARD=============="
    puts @board.render(true)
    @player_placements  = []
    puts "\nEnter the squares for the #{ship.name} (#{ship.length} spaces):"
    (ship.length).times do |i|
      puts "Position #{i + 1}: "
      ship_placement = gets.chomp.to_s.upcase

      player_placements << ship_placement
      end

    if @board.valid_placement?(ship, player_placements) == true
      puts "Nice! Your #{ship.name} has been placed!\n "
      @board.place(ship, player_placements)

      puts "=============COMPUTER BOARD============="
      puts @comp_board.render

    else
      puts "\nInvalid input. Please try again.\n "
      place_ships(ship)
    end
  end

  def end_program
    puts "Thanks for playing."
  end
end
