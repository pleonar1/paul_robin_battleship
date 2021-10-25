require './lib/ship'
require './lib/cell'
require './lib/board'

@board        = Board.new
@comp_board   = Board.new
@cruiser      = Ship.new("Cruiser", 3)
@submarine    = Ship.new("Submarine", 2)
@comp_cruiser = Ship.new("Cruiser", 3)
@comp_sub     = Ship.new("Submarine", 2)

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
  puts "==============PLAYER BOARD=============="
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
  puts "==============PLAYER BOARD=============="
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
    puts "=============COMPUTER BOARD============="
    puts @comp_board.render
    puts "==============PLAYER BOARD=============="
    puts @board.render(true)
    set_computer_cruiser
  else
    puts "Invalid input. Please try again."
    set_sub
  end
end

def set_computer_cruiser
  computer_cruiser_placements = []

  comp_cruiser_placement_1 = (('A'..'D').to_a.sample + rand(1..4).to_s)
  computer_cruiser_placements << comp_cruiser_placement_1

  comp_cruiser_placement_2 = (('A'..'D').to_a.sample + rand(1..4).to_s)
  computer_cruiser_placements << comp_cruiser_placement_2

  comp_cruiser_placement_3 = (('C'..'D').to_a.sample + rand(1..4).to_s)
  computer_cruiser_placements << comp_cruiser_placement_3

  # puts computer_cruiser_placements
  if @comp_board.valid_placement?(@comp_cruiser, computer_cruiser_placements) == true
    @comp_board.place(@comp_cruiser, computer_cruiser_placements)
    computer_cruiser_placements
    set_computer_submarine

  else
    set_computer_cruiser
  end
end

def set_computer_submarine
  computer_sub_placements = []

  comp_sub_placement_1 = (('A'..'D').to_a.sample + rand(1..4).to_s)
  computer_sub_placements << comp_sub_placement_1

  comp_sub_placement_2 = (('A'..'D').to_a.sample + rand(1..4).to_s)
  computer_sub_placements << comp_sub_placement_2

  if @comp_board.valid_placement?(@comp_sub, computer_sub_placements) == true
    @comp_board.place(@comp_sub, computer_sub_placements)
    gameplay
  else
    set_computer_submarine
  end

end

def gameplay
  until @comp_cruiser.ship_health == 0 && @comp_sub.ship_health == 0 || @cruiser.ship_health == 0 && @submarine.ship_health == 0
    take_turn
  end

  if @comp_cruiser.ship_health == 0 && @comp_sub.ship_health == 0
    puts "You won!"
  else
    puts "Computer has won. Better luck next time..."
    main_menu
  end
end

def take_turn
  puts "\n Enter the coordinate for your shot:"
  user_shot = gets.chomp.to_s.upcase
  if @comp_board.valid_coordinate?(user_shot) == true
    @comp_board.cells[user_shot].fire_upon
    puts "=============COMPUTER BOARD============="
    puts @comp_board.render
    computer_take_turn
  else
    puts "That is not a valid coordinate:"
    take_turn
  end
end

def computer_take_turn
  comp_shot = (('A'..'D').to_a.sample + rand(1..4).to_s)
  if @board.cells[comp_shot].health == 0
    computer_take_turn
  else
    @board.cells[comp_shot].fire_upon
    puts "==============PLAYER BOARD=============="
    puts @board.render(true)
    take_turn
  end
end



main_menu
