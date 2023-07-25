require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'

describe Game do
  it "exsits" do
    game_1 = Game.new

    expect(game_1).to be_a(Game)
  end
end

describe "#main_menu" do
  it "runs the main menu" do
    game_1 = Game.new
    game_1.main_menu

  end
end

describe "#game_placement" do
 it "places comp ships" do
  game_1 = Game.new
  game_1.game_placement

 end
end