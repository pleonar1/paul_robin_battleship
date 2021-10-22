require './lib/ship'
require './lib/cell'

class Board
  attr_reader :cells, :used_positions

  def initialize
    @cells = {
     "A1" => Cell.new("A1"),
     "A2" => Cell.new("A2"),
     "A3" => Cell.new("A3"),
     "A4" => Cell.new("A4"),
     "B1" => Cell.new("B1"),
     "B2" => Cell.new("B2"),
     "B3" => Cell.new("B3"),
     "B4" => Cell.new("B4"),
     "C1" => Cell.new("C1"),
     "C2" => Cell.new("C2"),
     "C3" => Cell.new("C3"),
     "C4" => Cell.new("C4"),
     "D1" => Cell.new("D1"),
     "D2" => Cell.new("D2"),
     "D3" => Cell.new("D3"),
     "D4" => Cell.new("D4"),
    }


    @possible_placements = [
      ["A1", "A2", "A3", "A4"],
      ["B1", "B2", "B3", "B4"],
      ["C1", "C2", "C3", "C4"],
      ["D1", "D2", "D3", "D4"],
      ["A1", "B1", "C1", "D1"],
      ["A2", "B2", "C2", "D2"],
      ["A3", "B3", "C3", "D3"],
      ["A4", "B4", "C4", "D4"]
    ]

    @all_placement_combos = []
    @all_placements = @possible_placements.flatten
    @placement_valid = false
    @used_positions = []
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate)
  end

  def valid_placement?(ship, placements)

    all_placement_combos(ship, placements)
    placement_check(ship, placements)

    if placements.first[0] == placements.last[0] || placements.first[1] == placements.last[1]
      @placement_valid = true
    else
      @placement_valid = false
    end

    if ship.length == placements.count
    else
      @placement_valid = false
    end

    if @all_placement_combos.any?(placements)
    else
      @placement_valid = false
    end

    placements.each do |placement|
      if @cells[placement].empty? == false
        @placement_valid = false
      end
    end
    @placement_valid
  end

  def all_placement_combos(ship, placements)
    @all_placements.each_cons(ship.length) { |placement| @all_placement_combos << placement}
  end

  def placement_check(ship, placements)
    if @all_placement_combos.any?(placements) == true
      @placement_valid = true
    else
      @placement_valid = false
    end
  end

  def place(ship, placements)
    if valid_placement?(ship, placements) == true
      placements.each do |placement|
        @cells[placement].place_ship(ship)
      end
    end
  end

  def render
    @new_board = Hash.new
    rendered_board = "  1 2 3 4 \n"
    ('A'..'D').each do |letter|
      rendered_board += "#{letter} "
      (1..4).each do |number|
         @new_board["#{letter}#{number}"] = "."
         rendered_board += @new_board["#{letter}#{number}"]
      end
      rendered_board

    end
  end
end

#EVENTUALLY WE WILL USE THE .each_cons METHOD TO ACCESS THESE. ALSO (any?, all?, none?) methods
