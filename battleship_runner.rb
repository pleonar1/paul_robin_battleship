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
  puts "I have laid out my ships on the grid."
  puts "You now need to lay out your two ships."
  puts "The Cruiser is three units long and the Submarine is two units long."
  puts @board.render


  player_placements = []
  puts "Enter the squares for the Cruiser (3 spaces):"
  puts "Position 1: "

  cruiser_placement_1 = gets.chomp.to_s.upcase
  player_placements << cruiser_placement_1
  puts "Position 2: "

  cruiser_placement_2 = gets.chomp.to_s.upcase
  player_placements << cruiser_placement_2
  puts "Position 3: "

  cruiser_placement_3 = gets.chomp.to_s.upcase
  # require "pry"; binding.pry
  player_placements << cruiser_placement_3


  if @board.valid_placement?(@cruiser, player_placements) == true
    puts "Nice! Your cruiser has been placed!"
    @board.place(@cruiser, player_placements)
    set_sub
  else
    puts "Invalid input. Please try again."
    start
  end
end

def set_sub
  puts "Now you can set your Submarine"
  puts "For a valid placement, the sub cannot overlap with cruiser"
  puts @board.render(true)

  player_placements = []
  puts "Enter the squares for the Submarine (2 spaces):"
  puts "Position 1: "

  sub_placement_1 = gets.chomp.to_s.upcase
  player_placements << sub_placement_1
  puts "Position 2: "
  sub_placement_2 = gets.chomp.to_s.upcase
  player_placements << sub_placement_2

  if @board.valid_placement?(@submarine, player_placements) == true
    puts "Nice! Your cruiser has been placed!"
    @board.place(@submarine, player_placements)
    puts @board.render(true)
    play_the_game
  else
    puts "Invalid input. Please try again."
    set_sub
  end
end

def play_the_game
  puts "time to play the game!"
end



main_menu
