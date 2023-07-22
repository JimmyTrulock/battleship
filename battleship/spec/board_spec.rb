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

    it "check for valid consecutive coordinates" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
    end

    it "check if coordinates are diagonal" do
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
    end

    it "confirms valid placement" do
      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
    end
  end

  describe "#place" do 
    it "places ship on the board" do
      @board.cells
      @board.place(@cruiser, ["A1", "A2", "A3"]) 
      cell_1 = @board.cells["A1"] 
      cell_2 = @board.cells["A2"]
      cell_3 = @board.cells["A3"] 

      expect(cell_1.ship).to eq(@cruiser)
      expect(cell_2.ship).to eq(@cruiser)
      expect(cell_3.ship).to eq(@cruiser)
      expect(cell_3.ship).to eq(cell_2.ship)
    end
  end
end