require './lib/ship'


describe Ship do
  before do 
  @cruiser = Ship.new("Cruiser", 3)
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@cruiser).to be_a(Ship)
    end
  end

  describe "#attributes" do
    it "has attributes" do
      expect(@cruiser.name).to eq("Cruiser")
      expect(@cruiser.length).to eq(3)
      expect(@cruiser.health).to eq(3)
    end
  end

  describe "#sunk" do
    it "can check if sunk" do
      expect(@cruiser.sunk?).to eq(false)
    end
  end

  describe "#hit" do
    it "can reduce health" do
      @cruiser.hit

      expect(@cruiser.health).to eq(2)

      @cruiser.hit

      expect(@cruiser.health).to eq(1)
    end
  end
end