require './lib/board'
require './lib/ship'
require './lib/cell'

class Game

  def initialize
    @player_1 = Board.new
    @computer = Board.new


  end

  def main_menu
    puts "Welcome to BATTLESHIP
    Enter p to play. Enter q to quit."

    answer = gets 
      if answer == "p"
        puts "Ok! Let's play!"
        @player_1.render(true)
        @computer.render

      elsif answer == "q"
        puts "Ok, see you next time."
      else 
        puts "Invalid command! Type p or q"
      end
    end
  end

  def game_placement
    puts "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long.
      1 2 3 4
    A . . . .
    B . . . .
    C . . . .
    D . . . .
    Enter the squares for the Cruiser (3 spaces)"
    cruiser_array = @computer.possible_cruiser.sample
    sub_array = @computer.possible_sub.sample

    @computer.place(cruiser, cruiser_array)

    # maybe need to refactor the computer method for 
    # ship placement in the Board class? 
  end
end