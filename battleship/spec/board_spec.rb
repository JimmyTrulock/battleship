require './lib/board'

describe Board do
  before do
    @board = Board.new
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

  
end