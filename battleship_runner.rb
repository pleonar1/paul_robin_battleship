require './lib/ship'
require './lib/cell'
require './lib/board'

@board =      Board.new
@cruiser =    Ship.new("Cruiser", 3)
@submarine =  Ship.new("Submarine", 2)

def main_menu
  p "Welcome to BATTLESHIP"
  p "Enter p to play. Enter q to quit."

  user_input = gets.chomp

  if user_input == "q"
    "Ok. Maybe another time!"
  elsif user_input == "p"
    "Awesome! Here we go!"
    start
  else
    "Please enter a valid key"
    user_input = gets.chomp
  end
end

def start
  p "I have laid out my ships on the grid."
  p "You now need to lay out your two ships."
  p "The Cruiser is three units long and the Submarine is two units long."
  @board.render
  until valid_placement?(@submarine, player_placements) == true
    player_placements = []
    p "Enter the squares for the Cruiser (3 spaces):"
    "Position 1: "
    '>'
    cruiser_placement_1 = gets.chomp.to_s
    player_placements << cruiser_placement_1
    "Position 2: "
    '>'
    cruiser_placement_2 = gets.chomp.to_s
    player_placements << cruiser_placement_2
    "Position 3: "
    '>'
    cruiser_placement_3 = gets.chomp.to_s
    player_placements << cruiser_placement_3

    @board.valid_placement?(@submarine, player_placements)
    if valid_placement? == true
      puts "Nice! Your cruiser has been placed!"
    else
      puts "Invalid input. Please try again."
    end
  end
end

main_menu
