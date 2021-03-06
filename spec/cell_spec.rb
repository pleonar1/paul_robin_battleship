require './lib/ship'
require './lib/cell'


RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
  end

  it 'shows cell attributes' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
    expect(cell.ship).to eq(nil)
    expect(cell.empty?).to eq(true)
  end

  it "can have a ship placed on it" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to eq false
  end

  it 'checks if ship is fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to eq false

    cell.fire_upon

    expect(cell.fired_upon?).to eq true
  end

  it 'renders the board' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.render).to eq(".")

    cell.fire_upon

    expect(cell.render).to eq("H")

    cruiser.hit
    cruiser.hit
    cruiser.hit

    expect(cell.render).to eq("X")
  end
end
