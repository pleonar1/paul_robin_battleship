require './lib/ship'
require './lib/card'
require './lib/board'

board = Board.new

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
