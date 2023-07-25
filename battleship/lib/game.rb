require './lib/board.rb'
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
      if answer == "p" || "P"
        puts "Ok! Let's play!"
        game_placement

      elsif answer == "q" || "Q"
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
    player_placment = gets

    if until valid_coordinate(player_placment) == true && valid_placement(player_placment) == true
      @player_1.place(cruiser, player_placment)
    else 
      "Invalid squares, please select again"
    end

    "Enter the squares for the Sub (2 spaces)"

    player_placment_2 = gets

    if until valid_coordinate(player_placment_2) == true && valid_placement(player_placment_2) == true
      @player_1.place(cruiser, player_placment_2)
    else 
      puts "Invalid squares, please select again"
    end

    cruiser_array = @computer.possible_cruiser.sample 
    sub_array = @computer.possible_sub.sample

    @computer.place(cruiser, cruiser_array)
    until overlaping?(sub_array) == true
      sub_array = @computer.possible_sub.sample
      @computer.place(sub, sub_array) 

     turn
  end

  def turn
    puts "=============COMPUTER BOARD============="
    puts @computer.render

    puts "==============PLAYER BOARD=============="
    puts @player_1.render(true)

    puts "Enter the coordinate for your shot:"
    shot = gets

    if valid_coordinate(shot) == true
       shot.

end