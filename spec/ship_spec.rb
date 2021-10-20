require './lib/ship'

RSpec.describe Ship do
  it 'shows cruiser attributes' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_instance_of(Ship)
    expect(cruiser.length).to eq(3)
    expect(cruiser.ship_health).to eq(3)
  end

  it 'checks if the cruiser is sunk' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.sunk?).to eq(false)

    cruiser.hit
    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to eq(true)
  end
end
