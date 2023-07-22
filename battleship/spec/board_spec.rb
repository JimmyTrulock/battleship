require './lib/board'
require './lib/ship'

describe Board do
  before do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  describe "#inialize" do
    it "can initialize" do
      expect(@board).to be_a(Board)
    end
  end

  describe "#attribute" do
    it "has attributes" do
      @board.cells

      expect(@board.count).to eq(16)
    end
  end

  describe "#valid_coordinate?" do
    it "can check for valid coordinates" do
      @board.cells

      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("A5")).to eq(false)
    end
  end

  describe "#valid_placement?" do
    it "can check for valid ship placement length" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
    end

  end
end