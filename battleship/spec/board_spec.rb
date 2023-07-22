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
      # require 'pry';binding.pry
      expect(@board.count).to eq(16)
    end
  end
end