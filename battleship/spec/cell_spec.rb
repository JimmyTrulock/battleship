require './lib/ship'
require './lib/cell'

describe Cell do
  before do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@cell).to be_a(Cell)
      expect(@cruiser).to be_a(Ship)
    end
  end
  describe "#attributes" do
    it "has attributes" do
      expect(@cell.coordinate).to eq("B4")
      expect(@cell.ship).to eq(nil)
      expect(@cell.empty).to eq(true)
    end
  end
end