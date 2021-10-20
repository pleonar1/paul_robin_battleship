require './lib/ship'
require './lib/cell'

class Board
  attr_reader :cells

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
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate)
  end

  possible_placements = {
    a_cells => ["A1", "A2", "A3", "A4"],
    b_cells => ["B1", "B2", "B3", "B4"],
    c_cells => ["C1", "C2", "C3", "C4"],
    d_cells => ["D1", "D2", "D3", "D4"],
    first_cells => ["A1", "B1", "C1", "D1"],
    second_cells => ["A2", "B2", "C2", "D2"],
    third_cells => ["A3", "C3", "C3", "D3"],
    fourth_cells => ["A4", "C4", "C4", "D4"]}



end
