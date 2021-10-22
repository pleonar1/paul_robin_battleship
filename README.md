# paul_robin_battleship
Robin and Paul's paired project
Learning goals
  - Have both parties able to explain what we are doing in this project.
Schedule
  - Mornings: Paul can edit code independently
  -Evenings: Robin can edit code independently
  - Driver navigator: 7:30EST 4:30PST onward
  - Weekend: Robin free after 1:00pm PST/4:00pm EST on Saturday/Sunday

  interaction patterns

  pry(main)> require './lib/board'
# => true

pry(main)> require './lib/ship'
# => true

pry(main)> board = Board.new
# => #<Board:0x00007fcb0f056860...>

pry(main)> cruiser = Ship.new("Cruiser", 3)    
# => #<Ship:0x00007fcb0f0573f0...>

pry(main)> board.place(cruiser, ["A1", "A2", "A3"])    

pry(main)> board.render
# => "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"

pry(main)> board.render(true)
# => "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
