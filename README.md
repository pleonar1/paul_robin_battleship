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
  
  pry(main)> cell.coordinate
  # => "B4"

  pry(main)> cell.ship
  # => nil

  pry(main)> cell.empty?
  # => true

  pry(main)> cruiser = Ship.new("Cruiser", 3)
  # => #<Ship:0x00007f84f0891238...>

  pry(main)> cell.place_ship(cruiser)

  pry(main)> cell.ship
  # => #<Ship:0x00007f84f0891238...>

  pry(main)> cell.empty?
  # => false
