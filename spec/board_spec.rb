require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe "Board" do

  it "exists" do
    board = Board.new

    expect(board).to be_a Board
  end

  it "has attributes" do
    board = Board.new

    expect(board.cells).to be_a Hash
  end

  it "can determine if a coordinate is valid or not" do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq true
    expect(board.valid_coordinate?("E1")).to eq false
    expect(board.valid_coordinate?("B2")).to eq true
    expect(board.valid_coordinate?("A22")).to eq false
  end

  it 'can determine valit ship placements' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end
end
