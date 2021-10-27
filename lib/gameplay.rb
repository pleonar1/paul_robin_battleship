require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/setup'
require './lib/computer_setup'

class Gameplay

  def initialize
    @cruiser          = Ship.new("Cruiser", 3)
    @submarine        = Ship.new("Submarine", 2)
    @comp_cruiser     = Ship.new("Computer Cruiser", 3)
    @comp_sub         = Ship.new("Computer Submarine", 2)
    @player_setup     = Setup.new
    @computer_setup   = ComputerSetup.new
  end

  def main_menu
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    user_input = gets.chomp
    if user_input == "q"
      "Ok. Maybe another time!"
      end_program
    elsif user_input == "p"
      "Awesome! Here we go!"
      start
    else
      "Please enter a valid key"
    end_program
    end
  end

  def start
    puts "\nI have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long.\n "
    @computer_setup.clear_board
    @player_setup.clear_board
    @computer_setup.place_computer_ship(@comp_cruiser)
    @computer_setup.place_computer_ship(@comp_sub)

    @player_setup.place_ships(@cruiser)
    puts "\nNow you can set your Submarine"
    puts "For a valid placement, the sub cannot overlap with cruiser\n\n"
    @player_setup.place_ships(@submarine)
    puts "==============PLAYER BOARD=============="
    puts @player_setup.board.render(true)
    take_turn
  end

  def take_turn
    puts "\n Enter the coordinate for your shot (ex: a1):"
    user_shot = gets.chomp.to_s.upcase
    if @computer_setup.comp_board.valid_coordinate?(user_shot) == true && @computer_setup.comp_board.cells[user_shot].fired_upon? == false
      @computer_setup.comp_board.cells[user_shot].fire_upon
      puts "\n=============COMPUTER BOARD============="
      puts @computer_setup.comp_board.render
      puts "\nYour shot on " + "#{user_shot.upcase}"
      puts "#{@computer_setup.comp_board.cells[user_shot].feedback}"
      is_game_over?
      computer_take_turn
    elsif user_shot == "!"
      end_program
    else
      puts "That is not a valid coordinate:"
      take_turn
    end
  end

  def computer_take_turn
    comp_shot = (('A'..'D').to_a.sample + rand(1..4).to_s)
    if @player_setup.board.cells[comp_shot].fired_upon? == true
      computer_take_turn
    else
      @player_setup.board.cells[comp_shot].fire_upon
      puts "\n==============PLAYER BOARD=============="
      puts @player_setup.board.render(true)
      puts "\nThe computer's shot on " + "#{comp_shot}"
      puts "#{@player_setup.board.cells[comp_shot].feedback}"
      is_game_over?
      take_turn
    end
  end

  def is_game_over?
    if @comp_cruiser.sunk? == true && @comp_sub.sunk? == true
      puts "You won!"
      clear_board
    elsif @cruiser.sunk? == true  && @submarine.sunk? == true
      puts "Computer has won. Better luck next time..."
      clear_board
    else
    end
  end

  def clear_board
    @cruiser          = Ship.new("Cruiser", 3)
    @submarine        = Ship.new("Submarine", 2)
    @comp_cruiser     = Ship.new("Computer Cruiser", 3)
    @comp_sub         = Ship.new("Computer Submarine", 2)

    main_menu
  end

  
  def end_program
    puts "Thanks for playing!"
    exit!
  end
end
