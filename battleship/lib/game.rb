require './lib/board'
require './lib/ship'
require './lib/cell'

class Game

  attr_accessor :player_1, :computer, :cruiser, :sub, :cpu_cruiser, :cpu_sub

    # def initialize
      
    # end

  def main_menu
    puts "Welcome to BATTLESHIP
    Enter p to play. Enter q to quit."

    answer = gets.chomp 

    if answer == "p" || answer == "P"
      puts "Ok! Let's play!"
      setup
      player_1_placement

    elsif answer == "q" || answer ==  "Q"
      puts "Ok, see you next time."
    else 
      puts "Invalid command! Type p or q"
    end
  end

  def setup
    @player_1 = Board.new
    @computer = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @sub = Ship.new("Submarine", 2)
    @cpu_cruiser = Ship.new("Cruiser", 3)
    @cpu_sub = Ship.new("Submarine", 2)
  end


  def player_1_placement
    puts "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long.
      1 2 3 4
    A . . . .
    B . . . .
    C . . . .
    D . . . .
    Enter the squares for the Cruiser (3 spaces)"


    loop do
      player_placment = gets.chomp.split
      if @player_1.valid_placement?(@cruiser, player_placment) == true
        @player_1.place(@cruiser, player_placment)
        break
      end
      puts "Invalid squares, please select again"
    end


    @player_1.render(true)

    puts "Enter the squares for the Sub (2 spaces)"

    loop do
      player_placment_2 = gets.chomp.split
      if @player_1.valid_placement?(@sub, player_placment_2) == true 
        @player_1.place(@sub, player_placment_2)
        break
      end
      puts "Invalid squares, please select again"
    end
    @player_1.render(true)
    computer_placement
  end

  def computer_placement

    loop do
      cruiser_array = @computer.possible_cruiser_placement

        if @computer.valid_placement?(@cpu_cruiser, cruiser_array) == true 
          @computer.place(@cpu_cruiser, cruiser_array)
          break
        
      end
    end

    #don't forget to take out the true when done testing
    @computer.render(true)

    loop do
      sub_array = @computer.possible_sub_placement

        if @computer.valid_placement?(@cpu_sub, sub_array) == true 
          @computer.place(@cpu_sub, sub_array)
          break
        
      end
    end
    #don't forget to remove true
    @computer.render(true)
  end
end

#   def turn
#     loop do
#       puts "=============COMPUTER BOARD============="
#       puts @computer.render(true)

#       puts "==============PLAYER BOARD=============="
#       puts @player_1.render(true)

#       puts "Enter the coordinate for your shot:"
#       shot = gets

#       if valid_coordinate(shot) == true
#           shot.attack
#       else
#         false
#       end
#     end
#   end
# end