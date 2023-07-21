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

  describe "#empty?" do
    it "checks if cell is empty" do
      expect(@cell.empty?).to eq(true)
    end
  end

  describe "#place_ship" do
    it "places ship in cell" do
      expect(@cell.place_ship(@cruiser)).to eq(@cruiser)
      expect(@cell.empty?).to eq(false)
    end
  end

  describe "#fired_upon?" do
    it "checks if the cell has been fired upon" do
      expect(@cell.fired_upon?).to eq(false)

      @cell.fire_upon

      expect(@cell.fired_upon?).to eq(true)
    end
  end
end