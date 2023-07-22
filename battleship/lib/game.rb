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

end