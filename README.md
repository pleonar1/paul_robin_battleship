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

  pry(main)> board.place(cruiser, ["A1", "A2", "A3"])    

  pry(main)> cell_1 = board.cells["A1"]    
  # => #<Cell:0x00007fcb0e1f66a8...>

  pry(main)> cell_2 = board.cells["A2"]
  # => #<Cell:0x00007fcb0e1f6630...>

  pry(main)> cell_3 = board.cells["A3"]    
  # => #<Cell:0x00007fcb0e1f65b8...>

  pry(main)> cell_1.ship
  # => #Cruiser

  pry(main)> cell_2.ship
  # => #Cruiser

  pry(main)> cell_3.ship
  # => #Cruiser

  pry(main)> cell_3.ship == cell_2.ship
  # => true
