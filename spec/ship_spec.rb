require './lib/ship'

RSpec.describe "Ship" do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end
end
